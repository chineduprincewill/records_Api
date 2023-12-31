<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Group;
use App\Models\Subgroup;
use App\Models\Event;
use App\Models\Member;
use App\Models\Donation;
use App\Models\Redemption;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class DonationController extends Controller
{
    //
    public function groupDonations (Request $request)
    {
        try {

            if(! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['user_not_found'], 404);
            }

            if($user->role !== 'admin' && $user->role !== "auditor"){
                return response()->json([
                    "message" => "You do not have the permission to access this resource!"
                ], 401);
            }

            $donations = Donation::where('groupid', $user->groupid)
                                ->where('status', 1)
                                ->orderBy('id', 'desc')
                                ->get();

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

            return response()->json(['token_expired'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidExceptions $e) {

            return response()->json(['token_invalid'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

            return response()->json(['token_absent'], $e->getStatusCode());

        }

        return response()->json(compact('donations'), 201);
    }


    public function filterDonations (Request $request)
    {
        try {

            if(! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['user_not_found'], 404);
            }

            if($user->role !== 'admin' && $user->role !== "auditor"){
                return response()->json([
                    "error" => "You do not have the permission to access this resource!"
                ], 401);
            }

            if($request->event != "" && $request->year != "")
            {
                $donations = Donation::where('event', $request->event)
                                ->where('event_year', $request->year)
                                ->where('groupid', $user->groupid)
                                ->orderBy('id', 'desc')
                                ->get();
            }
            else if($request->event != ''){
                $donations = Donation::where('event', $request->event)
                                ->where('groupid', $user->groupid)
                                ->orderBy('id', 'desc')
                                ->get();
            }
            else if($request->year != ''){
                $donations = Donation::where('event_year', $request->year)
                                ->where('groupid', $user->groupid)
                                ->orderBy('id', 'desc')
                                ->get();
            }

            

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

            return response()->json(['token_expired'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidExceptions $e) {

            return response()->json(['token_invalid'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

            return response()->json(['token_absent'], $e->getStatusCode());

        }

        return response()->json(compact('donations'), 201);
    }


    public function createDonation (Request $request)
    {
        $validator = Validator::make($request->all(), [
            'member' => 'required|integer',
            'event' => 'required|string|max:255',
            'year' => 'required|integer',
            'donation' => 'required|numeric|min:0|digits_between:1,12',
            'redeemed' => 'required|numeric|min:0|digits_between:1,12',
            'completepay' => 'required|string|max:3',
            'recorder' => 'required|string|max:255'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        try {

            if(! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['user_not_found'], 404);
            }

            $usertype = $user->role;
            $email = $user->email;

            if($usertype !== 'admin'){
                return response()->json([
                    "error" => "You do not have the permission to access this resource!"
                ], 401);
            }

            if($request->redeemed > $request->donation){
                return response()->json([
                    "error" => "Sorry! You cannot redeem more than pledged. You can add the excess as a new donation."
                ], 401);
            }

            $member = Member::find($request->get('member'));

            $donation = Donation::create([
                'member_id'=> $member->id,
                'uid' => $member->uid,
                'fullname' => $member->fullname,
                'mobile' => $member->mobile,
                'email' => $member->email,
                'gender' => $member->gender,
                'member_group' => $member->branch,
                'groupid' => $user->groupid,
                'group' => $user->groupname,
                'event' => $request->get('event'),
                'event_year' => $request->get('year'),
                'donation' => $request->get('donation'),
                'redeemed' => $request->get('completepay') == 'yes' ? $request->get('donation') : $request->get('redeemed'),
                'recorder' => $request->get('recorder') == 'self' ? $user->username : $request->get('recorder'),
                'created_by' => $email,
                'status' => 1,
            ]);

            if($request->completepay == 'yes'){
                Redemption::create([
                    'donation_id' => $donation->id,
                    'amount' => $request->donation,
                    'channel' => 'cash',
                    'received_by' => $request->recorder == 'self' ? $user->username : $request->recorder,
                    'created_by' => $user->username
                ]);
            }

            if($request->redeemed != 0){
                Redemption::create([
                    'donation_id' => $donation->id,
                    'amount' => $request->redeemed,
                    'channel' => 'cash',
                    'received_by' => $request->recorder == 'self' ? $user->username : $request->recorder,
                    'created_by' => $user->username
                ]);
            }

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

            return response()->json(['token_expired'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidExceptions $e) {

            return response()->json(['token_invalid'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

            return response()->json(['token_absent'], $e->getStatusCode());

        }

        //$users = User::all();
        $success = 'Donation Recorded Successfully!';

        return response()->json(compact('success'), 201);
    }


    public function result (Request $request)
    {
        $validator = Validator::make($request->all(), [
            'event' => 'required|string|max:255',
            'year' => 'required|integer'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        try {

            if(! $user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['user_not_found'], 404);
            }

            if($user->role !== 'admin' && $user->role !== "auditor"){
                return response()->json([
                    "message" => "You do not have the permission to access this resource!"
                ], 401);
            }

            $result = DB::table('donations')
                        ->join('members', 'donations.member_id', '=', 'members.id')
                        ->select('donations.fullname','donations.member_id','donations.event', 'donations.event_year','members.fullname', 'members.region', 'members.subgroup')
                        ->select(DB::raw('SUM(donations.redeemed) as paid'), 
                                DB::raw('SUM(donations.donation) as pledged'),
                                DB::raw('donations.member_id as member_id'),
                                DB::raw('donations.fullname as fullname'),
                                DB::raw('donations.event as event'),
                                DB::raw('donations.event_year as year'),
                                DB::raw('members.region as region'),
                                DB::raw('members.subgroup as subgroup'),
                            )
                        ->when($request->get('region') != '', function ($q) use ($request) {
                            return $q->where('members.region', $request->get('region'));
                        })
                        ->when($request->get('subgroup') != '', function ($q) use ($request) {
                            return $q->where('members.subgroup', $request->get('subgroup'));
                        })
                        ->where('donations.groupid', $user->groupid)
                        ->where('donations.event', $request->event)
                        ->where('donations.event_year', $request->year)
                        ->orderBy('paid', 'desc')
                        ->groupBy("donations.member_id")
                        ->groupBy("donations.fullname")
                        ->groupBy("donations.event")
                        ->groupBy("donations.event_year")
                        ->groupBy("members.region")
                        ->groupBy("members.subgroup")
                        ->get();

        } catch (Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {

            return response()->json(['token_expired'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\TokenInvalidExceptions $e) {

            return response()->json(['token_invalid'], $e->getStatusCode());

        } catch (Tymon\JWTAuth\Exceptions\JWTException $e) {

            return response()->json(['token_absent'], $e->getStatusCode());

        }

        return response()->json(compact('result'), 201);
    }
}

