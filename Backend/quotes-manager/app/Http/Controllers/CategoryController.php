<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Quote;
use App\Models\Category;
use App\Models\Author;
class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::all();  // Get all categories from the database
        return response()->json($categories);
    }
}
