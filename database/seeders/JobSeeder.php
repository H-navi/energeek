<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class JobSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();

        for ($i = 1; $i <= 50; $i++) {
            DB::table('jobs')->insert([
                'name' => $faker->jobTitle,
                "created_by" => 2,
                "created_at" => Carbon::now(),
            ]);
        }
    }
}
