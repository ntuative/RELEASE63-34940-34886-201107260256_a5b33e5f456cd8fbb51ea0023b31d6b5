package com.sulake.core.utils
{
   import flash.events.Event;
   
   public class LibraryLoaderEvent extends Event
   {
      
      public static const LIBRARY_LOADER_EVENT_COMPLETE:String = "LIBRARY_LOADER_EVENT_COMPLETE";
      
      public static const LIBRARY_LOADER_EVENT_PROGRESS:String = "LIBRARY_LOADER_EVENT_PROGRESS";
      
      public static const LIBRARY_LOADER_EVENT_UNLOAD:String = "LIBRARY_LOADER_EVENT_UNLOAD";
      
      public static const LIBRARY_LOADER_EVENT_STATUS:String = "LIBRARY_LOADER_EVENT_STATUS";
      
      public static const LIBRARY_LOADER_EVENT_ERROR:String = "LIBRARY_LOADER_EVENT_ERROR";
      
      public static const LIBRARY_LOADER_EVENT_DEBUG:String = "LIBRARY_LOADER_EVENT_DEBUG";
      
      public static const LIBRARY_LOADER_EVENT_DISPOSE:String = "LIBRARY_LOADER_EVENT_DISPOSE";
       
      
      private var var_435:int;
      
      private var var_2187:uint;
      
      private var var_2188:uint;
      
      private var var_2546:uint;
      
      public function LibraryLoaderEvent(param1:String, param2:int, param3:uint, param4:uint, param5:uint)
      {
         this.var_435 = param2;
         this.var_2187 = param3;
         this.var_2188 = param4;
         this.var_2546 = param5;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_435;
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_2187;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_2188;
      }
      
      public function get elapsedTime() : uint
      {
         return this.var_2546;
      }
      
      override public function clone() : Event
      {
         return new LibraryLoaderEvent(type,this.var_435,this.var_2187,this.var_2188,this.elapsedTime);
      }
   }
}
