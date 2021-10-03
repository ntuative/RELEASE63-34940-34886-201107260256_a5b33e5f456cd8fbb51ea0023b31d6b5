package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_185;
         param1["bound_to_parent_rect"] = const_105;
         param1["child_window"] = const_1280;
         param1["embedded_controller"] = const_1392;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_811;
         param1["mouse_dragging_target"] = const_281;
         param1["mouse_dragging_trigger"] = const_402;
         param1["mouse_scaling_target"] = const_380;
         param1["mouse_scaling_trigger"] = const_495;
         param1["horizontal_mouse_scaling_trigger"] = const_266;
         param1["vertical_mouse_scaling_trigger"] = const_247;
         param1["observe_parent_input_events"] = const_1254;
         param1["optimize_region_to_layout_size"] = const_668;
         param1["parent_window"] = const_1178;
         param1["relative_horizontal_scale_center"] = const_206;
         param1["relative_horizontal_scale_fixed"] = const_144;
         param1["relative_horizontal_scale_move"] = const_339;
         param1["relative_horizontal_scale_strech"] = const_413;
         param1["relative_scale_center"] = const_1246;
         param1["relative_scale_fixed"] = const_906;
         param1["relative_scale_move"] = const_1335;
         param1["relative_scale_strech"] = const_1263;
         param1["relative_vertical_scale_center"] = const_226;
         param1["relative_vertical_scale_fixed"] = const_169;
         param1["relative_vertical_scale_move"] = const_302;
         param1["relative_vertical_scale_strech"] = const_316;
         param1["on_resize_align_left"] = const_1003;
         param1["on_resize_align_right"] = const_544;
         param1["on_resize_align_center"] = const_506;
         param1["on_resize_align_top"] = const_924;
         param1["on_resize_align_bottom"] = const_591;
         param1["on_resize_align_middle"] = const_600;
         param1["on_accommodate_align_left"] = const_1320;
         param1["on_accommodate_align_right"] = const_561;
         param1["on_accommodate_align_center"] = const_902;
         param1["on_accommodate_align_top"] = const_1257;
         param1["on_accommodate_align_bottom"] = const_642;
         param1["on_accommodate_align_middle"] = const_961;
         param1["route_input_events_to_parent"] = const_650;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1313;
         param1["scalable_with_mouse"] = const_1256;
         param1["reflect_horizontal_resize_to_parent"] = const_585;
         param1["reflect_vertical_resize_to_parent"] = const_667;
         param1["reflect_resize_to_parent"] = const_345;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1191;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
