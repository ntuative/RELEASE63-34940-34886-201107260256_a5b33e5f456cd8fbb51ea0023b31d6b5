package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2015:int;
      
      private var _name:String;
      
      private var var_1242:int;
      
      private var var_2749:int;
      
      private var var_2462:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_667:String;
      
      private var var_2751:int;
      
      private var var_2752:int;
      
      private var var_2750:int;
      
      private var var_2753:int;
      
      private var var_2683:int;
      
      private var _ownerName:String;
      
      private var var_532:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_2015;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1242;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2749;
      }
      
      public function get experience() : int
      {
         return this.var_2462;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_667;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2751;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2752;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2750;
      }
      
      public function get respect() : int
      {
         return this.var_2753;
      }
      
      public function get ownerId() : int
      {
         return this.var_2683;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_532;
      }
      
      public function flush() : Boolean
      {
         this.var_2015 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_2015 = param1.readInteger();
         this._name = param1.readString();
         this.var_1242 = param1.readInteger();
         this.var_2749 = param1.readInteger();
         this.var_2462 = param1.readInteger();
         this.var_2751 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2752 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2750 = param1.readInteger();
         this.var_667 = param1.readString();
         this.var_2753 = param1.readInteger();
         this.var_2683 = param1.readInteger();
         this.var_532 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
