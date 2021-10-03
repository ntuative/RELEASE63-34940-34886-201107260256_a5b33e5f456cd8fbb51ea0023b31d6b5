package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_2015:int;
      
      private var var_1242:int;
      
      private var var_2681:int;
      
      private var var_2462:int;
      
      private var var_2686:int;
      
      private var _energy:int;
      
      private var var_2682:int;
      
      private var _nutrition:int;
      
      private var var_2688:int;
      
      private var var_2683:int;
      
      private var _ownerName:String;
      
      private var var_2753:int;
      
      private var var_532:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_2015;
      }
      
      public function get level() : int
      {
         return this.var_1242;
      }
      
      public function get levelMax() : int
      {
         return this.var_2681;
      }
      
      public function get experience() : int
      {
         return this.var_2462;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2686;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2682;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2688;
      }
      
      public function get ownerId() : int
      {
         return this.var_2683;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2753;
      }
      
      public function get age() : int
      {
         return this.var_532;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_2015 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1242 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2681 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2462 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2686 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2682 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2688 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2683 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2753 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_532 = param1;
      }
   }
}
