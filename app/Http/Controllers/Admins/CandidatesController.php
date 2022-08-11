<?php

namespace App\Http\Controllers\Admins;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use App\Models\Job;
use App\Models\Jobs;
use App\Models\Skill;
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
            'jobs' => Job::whereNotNull('deleted_at')->whereNotNull('deleted_by')->all(),
            'skills' => Skill::whereNotNull('deleted_at')->whereNotNull('deleted_by')->all(),
            'candidates' => Candidate::whereNotNull('deleted_at')->whereNotNull('deleted_by')->all(),
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
        if (auth()->user()->hasAnyRole(['super-admin', 'admin'])) {
            $this->validate($request, [
                'job' => 'required',
                'name' => ['required', 'max:100'],
                'email' => ['required', 'string', 'email', 'max:50', 'unique:users'],
                'phone' => ['required', 'max:15'],
                'year' => ['required', 'max:10'],
            ]);
            $moodel = Candidate::create([
                'job_id' => $request->job,
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'year' => $request->year,
                'created_by' => Auth::id(),
            ]);
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
        //
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
                'job' => 'required',
                'name' => ['required', 'max:100'],
                'email' => ['required', 'string', 'email', 'max:50', 'unique:users'],
                'phone' => ['required', 'max:15'],
                'year' => ['required', 'max:10'],
            ]);

            $candidate->update([
                'job_id' => $request->job,
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'year' => $request->year,
                'updated_by' => Auth::id(),
            ]);
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
            'deleted_at' => Carbon::now()->format('d-m-Y'),
        ]);
        return back();
    }
}
