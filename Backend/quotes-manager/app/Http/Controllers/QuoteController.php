<?php

namespace App\Http\Controllers;

use App\Models\Quote;
use Illuminate\Http\Request;

class QuoteController extends Controller
{
    public function index()
{
    return response()->json(
        \App\Models\Quote::with(['category', 'author'])->get()
    );
}


public function store(Request $request)
{
    $request->validate([
        'content' => 'required|string|max:255',
        'category_id' => 'required|exists:categories,id',
        'author_id' => 'required|exists:authors,id',
    ]);

    $quote = new Quote();
    $quote->content = $request->input('content');
    $quote->category_id = $request->input('category_id');
    $quote->author_id = $request->input('author_id');
    $quote->save();

    return response()->json($quote, 201);
}

}
