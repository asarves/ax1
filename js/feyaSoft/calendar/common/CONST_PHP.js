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
Ext.ns("Ext.ux.calendar");

Ext.ux.calendar.CONST = {
    /*
     * The version number of myCalendar
     */
    VERSION:'2.6.1',
    /*
     *true to show the language submenu in myCalendar, or not
     */
    SHOW_LANGUAGE_MENU:true,
    
    /*
     *define the main path of myCalendar
     */
    MAIN_PATH:'js/feyaSoft/calendar/',
    /*
     *define the multi-language path of myCalendar
     */
    CALENDAR_LANGUAGE_PATH:'js/feyaSoft/calendar/multi-language/',
    /*
     *define the multi-language path of EXT
     */
    EXT_LANGUAGE_PATH:'js/extjs/locale/',
    /*
     * define the some url here for datasource
     */
    searchURL:'/axagenda/db-proxy.php?action=search',

    showAllCalendarURL:'/axagenda/db-proxy.php?action=showAllCalendar',

    showOnlyCalendarURL:'/axagenda/db-proxy.php?action=showOnlyCalendar',

    createUpdateCalendarURL:'/axagenda/db-proxy.php?action=createUpdateCalendar',

    deleteEventsByCalendarURL:'/axagenda/db-proxy.php?action=deleteEventsByCalendar',

    deleteCalendarURL:'/axagenda/db-proxy.php?action=deleteCalendar',

    loadCalendarURL:'/axagenda/db-proxy.php?action=loadCalendar',

    loadEventURL:'/axagenda/db-proxy.php?action=loadEvent',

    loadRepeatEventURL:'/axagenda/db-proxy.php?action=loadRepeatEvent',

    createEventURL:'/axagenda/db-proxy.php?action=createEvent',

    updateEventURL:'/axagenda/db-proxy.php?action=updateEvent',

    deleteEventURL:'/axagenda/db-proxy.php?action=deleteEvent',

    deleteRepeatEventURL:'/axagenda/db-proxy.php?action=deleteRepeatEvent',

    changeDayURL:'/axagenda/db-proxy.php?action=changeDay',

    deleteDayURL:'/axagenda/db-proxy.php?action=deleteDay',

    loadSettingURL:'/axagenda/db-proxy.php?action=loadSetting',

    updateSettingURL:'/axagenda/db-proxy.php?action=updateSetting',

    createUpdateRepeatEventURL:'/axagenda/db-proxy.php?action=createUpdateRepeatEvent',

    initialLoadURL:'/axagenda/db-proxy.php?action=initialLoad'
};
