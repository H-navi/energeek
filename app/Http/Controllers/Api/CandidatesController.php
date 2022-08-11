<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use App\Models\Skill_set;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CandidatesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $candidates = Candidate::whereNull('deleted_at')->orWhereNull('deleted_by')->get();
        return response()->json([
            'success' => true,
            'messages' => 'OK',
            'data'    => $candidates
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'job' => 'required',
            'name' => ['required', 'max:100'],
            'email' => ['required', 'string', 'email', 'max:50', 'unique:users'],
            'phone' => ['required', 'max:15'],
            'year' => ['required', 'max:4'],
            'skills' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $check_email = Candidate::where('email', $request->email)->first();
        $check_phone = Candidate::where('phone', $request->phone)->first();

        if ($check_email != null || $check_phone  != null) :
            return response()->json([
                'success' => false,
                'message' => 'Error Email Duplicate',
            ], 409);
        endif;

        if (!is_numeric(str_replace(" ", "", $request->phone))) {
            return response()->json([
                'success' => false,
                'message' => 'Error Phone Duplicate',
            ], 409);
        }

        $model = Candidate::create([
            'job_id' => $request->job,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'year' => $request->year,
            'created_by' => 2,
        ]);

        $skills = $request->skills;
        foreach ($skills as $skill) :
            $store_skill = Skill_set::create([
                'candidate_id' => $model->id,
                'skill_id' => $skill,
            ]);
        endforeach;

        if ($model) {
            return response()->json([
                'success' => true,
                'message' => 'Created',
                'data'    => $model
            ], 201);
        }

        return response()->json([
            'success' => false,
            'message' => 'Failed to Save',
        ], 409);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $model = Candidate::where('id', $id)->first();

        if (is_null($model)) {
            abort(404);
        }

        $response = $model;
        $response['skills'] = Skill_set::where('candidate_id', $model->id)->get();

        //make response JSON
        return response()->json([
            'success' => true,
            'message' => 'Detail Data',
            'data'    => $response,
        ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, Candidate $candidate)
    {
        //  
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Candidate $candidate)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'max:100'],
            'email' => ['required', 'string', 'email', 'max:50', 'unique:users'],
            'phone' => ['required', 'max:15'],
            'year' => ['required', 'max:10'],
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $candidate = Candidate::findOrFail($candidate->id);

        if ($candidate) {

            $check_email = Candidate::where('email', $request->email)->first();
            $check_phone = Candidate::where('phone', $request->phone)->first();


            if($check_email != null && $request->email != $candidate->email)
            {
                return response()->json([
                    'success' => false,
                    'message' => 'Error Email Duplicate',
                ], 409);
            }

            if($check_phone != null && $request->phone != $candidate->phone)
            {
                return response()->json([
                    'success' => false,
                    'message' => 'Error Phone Duplicate',
                ], 409);
            }

            if (!is_numeric(str_replace(" ", "", $request->phone))) :
                return response()->json([
                    'success' => false,
                    'message' => 'Error Phone is not Number',
                ], 409);
            endif;

            $job = $request->job;
            if ($job != null) {
                $fjob = $job;
            } else {
                $fjob = $candidate->job_id;
            }

            $candidate->update([
                'job_id' => $fjob,
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'year' => $request->year,
                'updated_by' => 2,
            ]);

            $skills = $request->skills;
            $store_skill = null;
            if ($skills != null) :
                $get_prev_skills = Skill_set::where('candidate_id', $candidate->id)->get();
                foreach($get_prev_skills as $prev):
                    $prev->delete();
                endforeach;

                foreach ($skills as $skill) :
                    $store_skill = Skill_set::create([
                        'candidate_id' => $candidate->id,
                        'skill_id' => $skill,
                    ]);
                endforeach;
            endif;

            return response()->json([
                'success' => true,
                'message' => 'Updated',
                'data'    => $candidate,
                'skills'  => $store_skill
            ], 200);
        }

        return response()->json([
            'success' => false,
            'message' => 'Post Not Found',
        ], 404);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Candidate $candidate)
    {
        $candidate->update([
            'deleted_by' => 2,
            'deleted_at' => Carbon::now(),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Soft Deleted',
            'data'    => $candidate,
        ], 200);
    }
}
