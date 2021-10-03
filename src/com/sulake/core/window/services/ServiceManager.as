package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3084:uint;
      
      private var _root:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_715:IWindowContext;
      
      private var var_1188:IMouseDraggingService;
      
      private var var_1189:IMouseScalingService;
      
      private var var_1187:IMouseListenerService;
      
      private var var_1191:IFocusManagerService;
      
      private var var_1192:IToolTipAgentService;
      
      private var var_1190:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3084 = 0;
         this._root = param2;
         this.var_715 = param1;
         this.var_1188 = new WindowMouseDragger(param2);
         this.var_1189 = new WindowMouseScaler(param2);
         this.var_1187 = new WindowMouseListener(param2);
         this.var_1191 = new FocusManager(param2);
         this.var_1192 = new WindowToolTipAgent(param2);
         this.var_1190 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1188 != null)
         {
            this.var_1188.dispose();
            this.var_1188 = null;
         }
         if(this.var_1189 != null)
         {
            this.var_1189.dispose();
            this.var_1189 = null;
         }
         if(this.var_1187 != null)
         {
            this.var_1187.dispose();
            this.var_1187 = null;
         }
         if(this.var_1191 != null)
         {
            this.var_1191.dispose();
            this.var_1191 = null;
         }
         if(this.var_1192 != null)
         {
            this.var_1192.dispose();
            this.var_1192 = null;
         }
         if(this.var_1190 != null)
         {
            this.var_1190.dispose();
            this.var_1190 = null;
         }
         this._root = null;
         this.var_715 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1188;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1189;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1187;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1191;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1192;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1190;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
