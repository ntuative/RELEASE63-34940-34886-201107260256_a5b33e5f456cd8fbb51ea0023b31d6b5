package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_748;
         param1["badge"] = const_858;
         param1["bitmap"] = const_417;
         param1["border"] = const_859;
         param1["border_notify"] = const_2043;
         param1["bubble"] = const_967;
         param1["bubble_pointer_up"] = const_1234;
         param1["bubble_pointer_right"] = const_1247;
         param1["bubble_pointer_down"] = const_1399;
         param1["bubble_pointer_left"] = const_1233;
         param1["button"] = const_546;
         param1["button_thick"] = const_856;
         param1["button_icon"] = const_1892;
         param1["button_group_left"] = const_893;
         param1["button_group_center"] = const_863;
         param1["button_group_right"] = const_786;
         param1["canvas"] = const_829;
         param1["checkbox"] = const_900;
         param1["closebutton"] = const_1258;
         param1["container"] = const_422;
         param1["container_button"] = const_861;
         param1["display_object_wrapper"] = const_818;
         param1["dropmenu"] = const_547;
         param1["dropmenu_item"] = const_541;
         param1["frame"] = const_411;
         param1["frame_notify"] = const_2014;
         param1["header"] = const_1000;
         param1["html"] = const_1400;
         param1["icon"] = const_1273;
         param1["itemgrid"] = const_1361;
         param1["itemgrid_horizontal"] = const_649;
         param1["itemgrid_vertical"] = const_801;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_410;
         param1["itemlist_vertical"] = const_396;
         param1["label"] = const_738;
         param1["maximizebox"] = const_1757;
         param1["menu"] = const_1908;
         param1["menu_item"] = const_1969;
         param1["submenu"] = const_1381;
         param1["minimizebox"] = const_1869;
         param1["notify"] = const_1856;
         param1["null"] = const_919;
         param1["password"] = const_876;
         param1["radiobutton"] = const_946;
         param1["region"] = const_338;
         param1["restorebox"] = const_1862;
         param1["scaler"] = const_658;
         param1["scaler_horizontal"] = const_2041;
         param1["scaler_vertical"] = const_1943;
         param1["scrollbar_horizontal"] = const_528;
         param1["scrollbar_vertical"] = const_921;
         param1["scrollbar_slider_button_up"] = const_1215;
         param1["scrollbar_slider_button_down"] = const_1307;
         param1["scrollbar_slider_button_left"] = const_1272;
         param1["scrollbar_slider_button_right"] = const_1338;
         param1["scrollbar_slider_bar_horizontal"] = const_1308;
         param1["scrollbar_slider_bar_vertical"] = const_1194;
         param1["scrollbar_slider_track_horizontal"] = const_1248;
         param1["scrollbar_slider_track_vertical"] = const_1404;
         param1["scrollable_itemlist"] = const_2060;
         param1["scrollable_itemlist_vertical"] = const_562;
         param1["scrollable_itemlist_horizontal"] = const_1181;
         param1["selector"] = const_915;
         param1["selector_list"] = const_794;
         param1["submenu"] = const_1381;
         param1["tab_button"] = const_890;
         param1["tab_container_button"] = const_1217;
         param1["tab_context"] = const_405;
         param1["tab_content"] = const_1260;
         param1["tab_selector"] = const_755;
         param1["text"] = const_762;
         param1["input"] = const_911;
         param1["toolbar"] = const_1846;
         param1["tooltip"] = const_449;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
