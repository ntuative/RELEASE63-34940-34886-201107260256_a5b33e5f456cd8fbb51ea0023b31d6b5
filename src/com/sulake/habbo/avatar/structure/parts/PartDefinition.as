package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2881:String;
      
      private var var_2102:String;
      
      private var var_2880:String;
      
      private var var_2101:Boolean;
      
      private var var_2100:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2881 = String(param1["set-type"]);
         this.var_2102 = String(param1["flipped-set-type"]);
         this.var_2880 = String(param1["remove-set-type"]);
         this.var_2101 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_2100 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_2100;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_2100 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2881;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_2102;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2880;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_2101;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_2101 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_2102 = param1;
      }
   }
}
