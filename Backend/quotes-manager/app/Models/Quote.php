<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quote extends Model
{
    use HasFactory;

    protected $fillable = ['content', 'category_id', 'author_id'];

    // A Quote belongs to a Category
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    // A Quote belongs to an Author
    public function author()
    {
        return $this->belongsTo(Author::class);
    }
}
