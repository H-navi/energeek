<?php

namespace App\Http\Controllers\Admins;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use App\Models\Job;
use App\Models\Jobs;
use App\Models\Skill;
use App\Models\Skill_set;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class CandidatesController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:super-admin|admin|moderator']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Inertia::render('Admins/Candidates/Index', [
            'jobs' => Job::whereNull('deleted_at')->orWhereNull('deleted_by')->get(),
            'skills' => Skill::whereNull('deleted_at')->orWhereNull('deleted_by')->get(),
            'candidates' => Candidate::whereNull('deleted_at')->orWhereNull('deleted_by')->get(),
        ]);
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
        var_dump($request->request);die;
        if (auth()->user()->hasAnyRole(['super-admin', 'admin'])) {
            $this->validate($request, [
                'job' => 'required',
                'name' => ['required', 'max:100'],
                'email' => ['required', 'string', 'email', 'max:50', 'unique:users'],
                'phone' => ['required', 'max:15'],
                'year' => ['required', 'max:4'],
                'skills' => 'required',
            ]);

            $check_email = Candidate::where('email', $request->email)->first();
            $check_phone = Candidate::where('phone', $request->phone)->first();

            if ($check_email != null || $check_phone  != null) :
                return redirect()->route('admin.candidates.index')->with([
                    'message' => 'ErrorEmail',
                ]);
            endif;

            if (!is_numeric(str_replace(" ", "", $request->phone))) {
                return redirect()->route('admin.candidates.index')->with([
                    'message' => 'ErrorPhone',
                ]);
            }

            $model = Candidate::create([
                'job_id' => $request->job['id'],
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'year' => $request->year,
                'created_by' => Auth::id(),
            ]);

            $skills = $request->skills;
            foreach ($skills as $skill) :
                $store_skill = Skill_set::create([
                    'candidate_id' => $model->id,
                    'skill_id' => $skill['id'],
                ]);
            endforeach;

            return back();
        }
        return back();
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
        $skills = Skill_set::where('candidate_id', $model->id)->get();

        return Inertia::render('Admins/Candidates/Detail', [
            'model' => $response,
            'skillsets' => $skills
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
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
        if (auth()->user()->hasAnyRole(['super-admin', 'admin'])) {
            $this->validate($request, [
                // 'job' => 'required',
                'name' => ['required', 'max:100'],
                'email' => ['required', 'string', 'email', 'max:50', 'unique:users'],
                'phone' => ['required', 'max:15'],
                'year' => ['required', 'max:10'],
            ]);

            $candidate = Candidate::findOrFail($candidate->id);
            if (is_null($candidate)) {
                abort(404);
            }

            $check_email = Candidate::where('email', $request->email)->first();
            $check_phone = Candidate::where('phone', $request->phone)->first();


            if($check_email != null && $request->email != $candidate->email)
            {
                return redirect()->route('admin.candidates.index')->with([
                    'message' => 'ErrorEmail',
                ]);
            }

            if($check_phone != null && $request->phone != $candidate->phone)
            {
                return redirect()->route('admin.candidates.index')->with([
                    'message' => 'ErrorPhone',
                ]);
            }

            if (!is_numeric(str_replace(" ", "", $request->phone))) :
                return redirect()->route('admin.candidates.index')->with([
                    'message' => 'ErrorPhone',
                ]);
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
                'updated_by' => Auth::id(),
            ]);

            $skills = $request->skills;
            if ($skills != null) :
                $get_prev_skills = Skill_set::where('candidate_id', $candidate->id)->get();
                foreach($get_prev_skills as $prev):
                    $prev->delete();
                endforeach;

                foreach ($skills as $skill) :
                    $store_skill = Skill_set::create([
                        'candidate_id' => $candidate->id,
                        'skill_id' => $skill['id'],
                    ]);
                endforeach;
            endif;
            return back();
        }
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(Candidate $candidate)
    {
        // if (auth()->user()->hasAnyRole(['super-admin', 'admin'])) {
        //     $candidate->delete();
        //     return back();
        // }
        $candidate->update([
            'deleted_by' => Auth::id(),
            'deleted_at' => Carbon::now(),
        ]);
        return back();
    }
}
