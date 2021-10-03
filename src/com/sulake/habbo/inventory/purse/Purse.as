package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2133:int = 0;
      
      private var var_2132:int = 0;
      
      private var var_3051:int = 0;
      
      private var var_3050:Boolean = false;
      
      private var var_2797:Boolean = false;
      
      private var var_2914:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2133 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2132 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_3051 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_3050 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2797 = param1;
      }
      
      public function set clubIsExpiring(param1:Boolean) : void
      {
         this.var_2914 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2133;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2132;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_3051;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_3050;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2797;
      }
      
      public function get clubIsExpiring() : Boolean
      {
         return this.var_2914;
      }
   }
}
