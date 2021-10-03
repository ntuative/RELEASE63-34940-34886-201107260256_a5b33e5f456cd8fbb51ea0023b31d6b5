package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1897:int = 0;
      
      private var var_1664:Dictionary;
      
      private var var_2133:int = 0;
      
      private var var_2132:int = 0;
      
      private var var_2797:Boolean = false;
      
      private var var_2805:int = 0;
      
      private var var_2804:int = 0;
      
      private var var_2914:Boolean = false;
      
      public function Purse()
      {
         this.var_1664 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1897;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1897 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2133;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2133 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2132;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2132 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_2133 > 0 || this.var_2132 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2797;
      }
      
      public function get isExpiring() : Boolean
      {
         return this.var_2914;
      }
      
      public function set isExpiring(param1:Boolean) : void
      {
         this.var_2914 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2797 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2805;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2805 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2804;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2804 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1664;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1664 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1664[param1];
      }
   }
}
