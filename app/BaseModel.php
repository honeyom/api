<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model
{
    //
    public function getTable()
    {
        return $this->table?$this->table:strtolower(snake_case(class_basename($this)));; // TODO: Change the autogenerated stub
    }
}
