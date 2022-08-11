<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SkillSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $skills = [
            'php',
            'python',
            'java',
            'laravel',
            'yii2',
            'reactJs',
            'vue.js',
            'flutter',
            'mysql',
            'jquery',
            'css',
            'javascript',
        ];

        $faker = \Faker\Factory::create();

        foreach ($skills as $skill) :
            DB::table("skills")->insert([
                "name" => $skill,
                "created_by" => 2,
                "created_at" => Carbon::now(),
            ]);
        endforeach;
    }
}
