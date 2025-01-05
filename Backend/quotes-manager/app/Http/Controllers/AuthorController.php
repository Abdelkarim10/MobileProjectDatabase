<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Quote;
use App\Models\Category;
use App\Models\Author;
class AuthorController extends Controller
{
    public function index()
    {
        $authors = Author::all();  // Get all authors from the database
        return response()->json($authors);
    }
}
