<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * CalendarSetting
 *
 * @ORM\Table(name="calendar_setting")
 * @ORM\Entity
 */
class CalendarSetting
{
    /**
     * @var integer
     *
     * @ORM\Column(name="userId", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $userid;

    /**
     * @var string
     *
     * @ORM\Column(name="hourFormat", type="string", length=255, nullable=true)
     */
    private $hourformat;

    /**
     * @var string
     *
     * @ORM\Column(name="dayFormat", type="string", length=255, nullable=true)
     */
    private $dayformat;

    /**
     * @var string
     *
     * @ORM\Column(name="weekFormat", type="string", length=255, nullable=true)
     */
    private $weekformat;

    /**
     * @var string
     *
     * @ORM\Column(name="monthFormat", type="string", length=255, nullable=true)
     */
    private $monthformat;

    /**
     * @var string
     *
     * @ORM\Column(name="fromtoFormat", type="string", length=255, nullable=true)
     */
    private $fromtoformat;

    /**
     * @var string
     *
     * @ORM\Column(name="activeStartTime", type="string", length=255, nullable=false)
     */
    private $activestarttime;

    /**
     * @var string
     *
     * @ORM\Column(name="activeEndTime", type="string", length=255, nullable=false)
     */
    private $activeendtime;

    /**
     * @var boolean
     *
     * @ORM\Column(name="createByDblclick", type="boolean", nullable=false)
     */
    private $createbydblclick;

    /**
     * @var boolean
     *
     * @ORM\Column(name="hideInactiveRow", type="boolean", nullable=false)
     */
    private $hideinactiverow;

    /**
     * @var boolean
     *
     * @ORM\Column(name="singleDay", type="boolean", nullable=false)
     */
    private $singleday;

    /**
     * @var string
     *
     * @ORM\Column(name="language", type="string", length=255, nullable=false)
     */
    private $language;

    /**
     * @var integer
     *
     * @ORM\Column(name="intervalSlot", type="integer", nullable=false)
     */
    private $intervalslot;

    /**
     * @var string
     *
     * @ORM\Column(name="startDay", type="string", length=255, nullable=false)
     */
    private $startday;

    /**
     * @var boolean
     *
     * @ORM\Column(name="readOnly", type="boolean", nullable=true)
     */
    private $readonly;

    /**
     * @var integer
     *
     * @ORM\Column(name="initialView", type="integer", nullable=false)
     */
    private $initialview;


    /**
     * Get userid
     *
     * @return integer 
     */
    public function getUserid()
    {
        return $this->userid;
    }

    /**
     * Set hourformat
     *
     * @param string $hourformat
     * @return CalendarSetting
     */
    public function setHourformat($hourformat)
    {
        $this->hourformat = $hourformat;

        return $this;
    }

    /**
     * Get hourformat
     *
     * @return string 
     */
    public function getHourformat()
    {
        return $this->hourformat;
    }

    /**
     * Set dayformat
     *
     * @param string $dayformat
     * @return CalendarSetting
     */
    public function setDayformat($dayformat)
    {
        $this->dayformat = $dayformat;

        return $this;
    }

    /**
     * Get dayformat
     *
     * @return string 
     */
    public function getDayformat()
    {
        return $this->dayformat;
    }

    /**
     * Set weekformat
     *
     * @param string $weekformat
     * @return CalendarSetting
     */
    public function setWeekformat($weekformat)
    {
        $this->weekformat = $weekformat;

        return $this;
    }

    /**
     * Get weekformat
     *
     * @return string 
     */
    public function getWeekformat()
    {
        return $this->weekformat;
    }

    /**
     * Set monthformat
     *
     * @param string $monthformat
     * @return CalendarSetting
     */
    public function setMonthformat($monthformat)
    {
        $this->monthformat = $monthformat;

        return $this;
    }

    /**
     * Get monthformat
     *
     * @return string 
     */
    public function getMonthformat()
    {
        return $this->monthformat;
    }

    /**
     * Set fromtoformat
     *
     * @param string $fromtoformat
     * @return CalendarSetting
     */
    public function setFromtoformat($fromtoformat)
    {
        $this->fromtoformat = $fromtoformat;

        return $this;
    }

    /**
     * Get fromtoformat
     *
     * @return string 
     */
    public function getFromtoformat()
    {
        return $this->fromtoformat;
    }

    /**
     * Set activestarttime
     *
     * @param string $activestarttime
     * @return CalendarSetting
     */
    public function setActivestarttime($activestarttime)
    {
        $this->activestarttime = $activestarttime;

        return $this;
    }

    /**
     * Get activestarttime
     *
     * @return string 
     */
    public function getActivestarttime()
    {
        return $this->activestarttime;
    }

    /**
     * Set activeendtime
     *
     * @param string $activeendtime
     * @return CalendarSetting
     */
    public function setActiveendtime($activeendtime)
    {
        $this->activeendtime = $activeendtime;

        return $this;
    }

    /**
     * Get activeendtime
     *
     * @return string 
     */
    public function getActiveendtime()
    {
        return $this->activeendtime;
    }

    /**
     * Set createbydblclick
     *
     * @param boolean $createbydblclick
     * @return CalendarSetting
     */
    public function setCreatebydblclick($createbydblclick)
    {
        $this->createbydblclick = $createbydblclick;

        return $this;
    }

    /**
     * Get createbydblclick
     *
     * @return boolean 
     */
    public function getCreatebydblclick()
    {
        return $this->createbydblclick;
    }

    /**
     * Set hideinactiverow
     *
     * @param boolean $hideinactiverow
     * @return CalendarSetting
     */
    public function setHideinactiverow($hideinactiverow)
    {
        $this->hideinactiverow = $hideinactiverow;

        return $this;
    }

    /**
     * Get hideinactiverow
     *
     * @return boolean 
     */
    public function getHideinactiverow()
    {
        return $this->hideinactiverow;
    }

    /**
     * Set singleday
     *
     * @param boolean $singleday
     * @return CalendarSetting
     */
    public function setSingleday($singleday)
    {
        $this->singleday = $singleday;

        return $this;
    }

    /**
     * Get singleday
     *
     * @return boolean 
     */
    public function getSingleday()
    {
        return $this->singleday;
    }

    /**
     * Set language
     *
     * @param string $language
     * @return CalendarSetting
     */
    public function setLanguage($language)
    {
        $this->language = $language;

        return $this;
    }

    /**
     * Get language
     *
     * @return string 
     */
    public function getLanguage()
    {
        return $this->language;
    }

    /**
     * Set intervalslot
     *
     * @param integer $intervalslot
     * @return CalendarSetting
     */
    public function setIntervalslot($intervalslot)
    {
        $this->intervalslot = $intervalslot;

        return $this;
    }

    /**
     * Get intervalslot
     *
     * @return integer 
     */
    public function getIntervalslot()
    {
        return $this->intervalslot;
    }

    /**
     * Set startday
     *
     * @param string $startday
     * @return CalendarSetting
     */
    public function setStartday($startday)
    {
        $this->startday = $startday;

        return $this;
    }

    /**
     * Get startday
     *
     * @return string 
     */
    public function getStartday()
    {
        return $this->startday;
    }

    /**
     * Set readonly
     *
     * @param boolean $readonly
     * @return CalendarSetting
     */
    public function setReadonly($readonly)
    {
        $this->readonly = $readonly;

        return $this;
    }

    /**
     * Get readonly
     *
     * @return boolean 
     */
    public function getReadonly()
    {
        return $this->readonly;
    }

    /**
     * Set initialview
     *
     * @param integer $initialview
     * @return CalendarSetting
     */
    public function setInitialview($initialview)
    {
        $this->initialview = $initialview;

        return $this;
    }

    /**
     * Get initialview
     *
     * @return integer 
     */
    public function getInitialview()
    {
        return $this->initialview;
    }
}
