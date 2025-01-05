<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class Author extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'bio'];

    // One Author has many Quotes
    public function quotes()
    {
        return $this->hasMany(Quote::class);
    }
}
