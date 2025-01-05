<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AuthorsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('authors')->insert([
            ['name' => 'Albert Einstein', 'bio' => 'Physicist and visionary.'],
            ['name' => 'Mark Twain', 'bio' => 'Famous American writer and humorist.'],
        ]);
    }
}
