package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2579:int;
      
      private var var_2149:String;
      
      private var var_2905:String;
      
      private var var_2904:Boolean;
      
      private var var_2902:Boolean;
      
      private var var_2900:int;
      
      private var var_2901:String;
      
      private var var_2903:String;
      
      private var var_1772:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2579 = param1.readInteger();
         this.var_2149 = param1.readString();
         this.var_2905 = param1.readString();
         this.var_2904 = param1.readBoolean();
         this.var_2902 = param1.readBoolean();
         param1.readString();
         this.var_2900 = param1.readInteger();
         this.var_2901 = param1.readString();
         this.var_2903 = param1.readString();
         this.var_1772 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2579;
      }
      
      public function get avatarName() : String
      {
         return this.var_2149;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2905;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2904;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2902;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2900;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2901;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2903;
      }
      
      public function get realName() : String
      {
         return this.var_1772;
      }
   }
}
