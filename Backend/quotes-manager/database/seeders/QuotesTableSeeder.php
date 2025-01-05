<?php

namespace Database\Seeders;

use App\Models\Quote;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class QuotesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Quote::create([
            'content' => 'Success is not final; failure is not fatal: It is the courage to continue that counts.',
            'category_id' => 1, 
            'author_id' => 1,   
        ]);
    }
}
