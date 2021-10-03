package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1649:int;
      
      private var var_2124:Number;
      
      private var var_2897:Number;
      
      private var var_2895:int;
      
      private var var_2894:Number;
      
      private var var_2896:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1649 = param1;
         this.var_2124 = param2;
         this.var_2897 = param3;
         this.var_2894 = param4;
         this.var_2896 = param5;
         this.var_2895 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1649;
      }
      
      public function get startPos() : Number
      {
         if(this.var_2124 < 0)
         {
            return 0;
         }
         return this.var_2124 + (getTimer() - this.var_2895) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2897;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2894;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2896;
      }
   }
}
