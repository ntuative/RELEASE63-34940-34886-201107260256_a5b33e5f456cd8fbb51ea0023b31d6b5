package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1789:String;
      
      private var var_1787:int;
      
      private var var_1788:int;
      
      private var var_1997:int;
      
      private var _id:int;
      
      private var var_1791:Boolean;
      
      private var _type:String;
      
      private var var_2437:String;
      
      private var var_2440:int;
      
      private var var_1786:String;
      
      private var var_2439:int;
      
      private var var_2438:int;
      
      private var var_1473:int;
      
      private var var_1790:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_1790 = new Date();
         super();
         this.var_1789 = param1.readString();
         this.var_1787 = param1.readInteger();
         this.var_1788 = param1.readInteger();
         this.var_1997 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1791 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2437 = param1.readString();
         this.var_2440 = param1.readInteger();
         this.var_1786 = param1.readString();
         this.var_2439 = param1.readInteger();
         this.var_2438 = param1.readInteger();
         this.var_1473 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.var_1789;
      }
      
      public function get localizationCode() : String
      {
         return this.var_1786;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_1787;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_1788;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1997;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1791;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2437;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_2440;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2439;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2438;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1473 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_1790.getTime();
         return int(Math.max(0,this.var_1473 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1789;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_1786;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1791 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_1787 >= this.var_1788;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_1790;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1473 = param1;
      }
   }
}
