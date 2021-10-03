package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2259:int = 1;
      
      public static const RESPONSE_TYPE_PURCHASE:int = 2;
      
      public static const const_1422:int = 3;
       
      
      private var var_959:String;
      
      private var var_2802:int;
      
      private var var_2795:int;
      
      private var var_2800:int;
      
      private var var_2799:int;
      
      private var var_2798:Boolean;
      
      private var var_2797:Boolean;
      
      private var var_2805:int;
      
      private var var_2804:int;
      
      private var var_2801:Boolean;
      
      private var var_2796:int;
      
      private var var_2803:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_959 = param1.readString();
         this.var_2802 = param1.readInteger();
         this.var_2795 = param1.readInteger();
         this.var_2800 = param1.readInteger();
         this.var_2799 = param1.readInteger();
         this.var_2798 = param1.readBoolean();
         this.var_2797 = param1.readBoolean();
         this.var_2805 = param1.readInteger();
         this.var_2804 = param1.readInteger();
         this.var_2801 = param1.readBoolean();
         this.var_2796 = param1.readInteger();
         this.var_2803 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_959;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2802;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2795;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2800;
      }
      
      public function get responseType() : int
      {
         return this.var_2799;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2798;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2797;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2805;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2804;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2801;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2796;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2803;
      }
   }
}
