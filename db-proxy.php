<?php
/**
 * FeyaSoft MyCalendar
 * Copyright(c) 2006-2012, FeyaSoft Inc. All right reserved.
 * info@cubedrive.com
 * http://www.cubedrive.com
 *
 * Please read license first before your use myCalendar, For more detail
 * information, please can visit our link: http://www.cubedrive.com/myCalendar
 *
 * You need buy one of the Feyasoft's License if you want to use MyCalendar in
 * your commercial product. You must not remove, obscure or interfere with any
 * FeyaSoft copyright, acknowledgment, attribution, trademark, warning or
 * disclaimer statement affixed to, incorporated in or otherwise applied in
 * connection with the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 * KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * WARRANTIES OF MERCHANTABILITY,FITNESS FOR A PARTICULAR PURPOSE
 * AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
$res = 0;
if (! $res && file_exists("../main.inc.php")) {
    $res = @include("../main.inc.php");
}
if (! $res && file_exists("../../main.inc.php")) {
    $res = @include("../../main.inc.php");
}
if (! $res && file_exists("../../../main.inc.php")) {
    $res = @include("../../../main.inc.php");
}
// The following should only be used in development environments
if (! $res && file_exists("../../../dolibarr/htdocs/main.inc.php")) {
    $res = @include("../../../dolibarr/htdocs/main.inc.php");
}
if (! $res && file_exists("../../../../dolibarr/htdocs/main.inc.php")) {
    $res = @include("../../../../dolibarr/htdocs/main.inc.php");
}
if (! $res && file_exists("../../../../../dolibarr/htdocs/main.inc.php")) {
    $res = @include("../../../../../dolibarr/htdocs/main.inc.php");
}
if (! $res) {
    die("Main include failed");
}

require_once DOL_DOCUMENT_ROOT."/axagenda/class/load_classes.php";

if(class_exists('CalendarAgent'))
  {
    $agent = new CalendarAgent();

    $action = $_GET["action"];
    if("search" == $action){
      echo $agent->search($_REQUEST);
    }else if("showAllCalendar" == $action){
      echo $agent->showAllCalendar($_REQUEST);
    }else if("showOnlyCalendar" == $action){
      echo $agent->showOnlyCalendar($_REQUEST);
    }else if("createUpdateCalendar" == $action){
      echo $agent->createUpdateCalendar($_REQUEST);
    }else if("deleteEventsByCalendar" == $action){
      echo $agent->deleteEventsByCalendar($_REQUEST);
    }else if("deleteCalendar" == $action){
      echo $agent->deleteCalendar($_REQUEST);
    }else if("loadCalendar" == $action){
      echo $agent->loadCalendar($_REQUEST);
    }else if("loadEvent" == $action){
      echo $agent->loadEvent($_REQUEST);
    }else if("loadRepeatEvent" == $action){
      echo $agent->loadRepeatEvent($_REQUEST);
    }else if("createEvent" == $action){
      echo $agent->createEvent($_REQUEST);
    }else if("updateEvent" == $action){
      echo $agent->updateEvent($_REQUEST);
    }else if("deleteEvent" == $action){
      echo $agent->deleteEvent($_REQUEST);
    }else if("deleteRepeatEvent" == $action){
      echo $agent->deleteRepeatEvent($_REQUEST);
    }else if("changeDay" == $action){
      echo $agent->changeDay($_REQUEST);
    }else if("deleteDay" == $action){
      echo $agent->deleteDay($_REQUEST);
    }else if("loadSetting" == $action){
      echo $agent->loadSetting($_REQUEST);
    }else if("updateSetting" == $action){
      echo $agent->updateSetting($_REQUEST);
    }else if("createUpdateRepeatEvent" == $action){
      echo $agent->createUpdateRepeatEvent($_REQUEST);
    }else if("initialLoad" == $action){
      dol_syslog("GREG db-pryx initialLoad");
      $params = $_POST;
      echo $agent->initialLoad($params);
    }else{
      echo 'No such action';
    }
  }
?>