package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var var_50:HabboQuestEngine;
      
      private var var_534:QuestsList;
      
      private var var_443:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_378:QuestTracker;
      
      private var var_640:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this.var_50 = param1;
         this.var_378 = new QuestTracker(this.var_50);
         this.var_534 = new QuestsList(this.var_50);
         this.var_443 = new QuestDetails(this.var_50);
         this._questCompleted = new QuestCompleted(this.var_50);
         this.var_640 = new NextQuestTimer(this.var_50);
      }
      
      public function onToolbarClick() : void
      {
         this.var_534.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_534.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_378.onQuest(param1);
         this.var_443.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_640.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_378.onQuestCompleted(param1);
         this.var_443.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_378.onQuestCancelled();
         this.var_443.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_640.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_378.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_534.onRoomExit();
         this.var_378.onRoomExit();
         this.var_443.onRoomExit();
         this.var_640.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_378.update(param1);
         this.var_640.update(param1);
         this.var_534.update(param1);
         this.var_443.update(param1);
      }
      
      public function dispose() : void
      {
         this.var_50 = null;
         if(this.var_534)
         {
            this.var_534.dispose();
            this.var_534 = null;
         }
         if(this.var_378)
         {
            this.var_378.dispose();
            this.var_378 = null;
         }
         if(this.var_443)
         {
            this.var_443.dispose();
            this.var_443 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_640)
         {
            this.var_640.dispose();
            this.var_640 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_50 == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_534;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_443;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_378;
      }
   }
}
