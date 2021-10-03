package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1242:int;
      
      private var var_1736:int;
      
      private var var_2792:int;
      
      private var var_2794:int;
      
      private var var_2448:int;
      
      private var var_1943:int;
      
      private var var_2872:String = "";
      
      private var var_2873:String = "";
      
      private var var_2874:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1242 = param1.readInteger();
         this.var_1943 = param1.readInteger();
         this.var_2872 = param1.readString();
         this.var_1736 = param1.readInteger();
         this.var_2792 = param1.readInteger();
         this.var_2794 = param1.readInteger();
         this.var_2448 = param1.readInteger();
         this.var_2874 = param1.readInteger();
         this.var_2873 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1242;
      }
      
      public function get points() : int
      {
         return this.var_1736;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2792;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2794;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_2448;
      }
      
      public function get badgeId() : int
      {
         return this.var_1943;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2872;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2873;
      }
      
      public function get achievementID() : int
      {
         return this.var_2874;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
