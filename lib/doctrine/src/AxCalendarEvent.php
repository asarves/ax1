<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * AxCalendarEvent
 *
 * @ORM\Table(name="ax_calendar_event", indexes={@ORM\Index(name="FK2A9BEA59743E7F7", columns={"calendarId"}), @ORM\Index(name="FK2A9BEA59581C403A", columns={"userId"})})
 * @ORM\Entity
 */
class AxCalendarEvent
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="bigint")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="userId", type="bigint", nullable=false)
     */
    private $userid;

    /**
     * @var integer
     *
     * @ORM\Column(name="calendarId", type="bigint", nullable=false)
     */
    private $calendarid;

    /**
     * @var string
     *
     * @ORM\Column(name="repeatType", type="text", nullable=false)
     */
    private $repeattype;

    /**
     * @var string
     *
     * @ORM\Column(name="startTime", type="string", length=255, nullable=false)
     */
    private $starttime;

    /**
     * @var string
     *
     * @ORM\Column(name="endTime", type="string", length=255, nullable=false)
     */
    private $endtime;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="creation_date", type="datetime", nullable=false)
     */
    private $creationDate;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", nullable=true)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="subject", type="string", length=255, nullable=true)
     */
    private $subject;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="update_date", type="datetime", nullable=false)
     */
    private $updateDate;

    /**
     * @var boolean
     *
     * @ORM\Column(name="locked", type="boolean", nullable=false)
     */
    private $locked;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set userid
     *
     * @param integer $userid
     * @return AxCalendarEvent
     */
    public function setUserid($userid)
    {
        $this->userid = $userid;

        return $this;
    }

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
     * Set calendarid
     *
     * @param integer $calendarid
     * @return AxCalendarEvent
     */
    public function setCalendarid($calendarid)
    {
        $this->calendarid = $calendarid;

        return $this;
    }

    /**
     * Get calendarid
     *
     * @return integer 
     */
    public function getCalendarid()
    {
        return $this->calendarid;
    }

    /**
     * Set repeattype
     *
     * @param string $repeattype
     * @return AxCalendarEvent
     */
    public function setRepeattype($repeattype)
    {
        $this->repeattype = $repeattype;

        return $this;
    }

    /**
     * Get repeattype
     *
     * @return string 
     */
    public function getRepeattype()
    {
        return $this->repeattype;
    }

    /**
     * Set starttime
     *
     * @param string $starttime
     * @return AxCalendarEvent
     */
    public function setStarttime($starttime)
    {
        $this->starttime = $starttime;

        return $this;
    }

    /**
     * Get starttime
     *
     * @return string 
     */
    public function getStarttime()
    {
        return $this->starttime;
    }

    /**
     * Set endtime
     *
     * @param string $endtime
     * @return AxCalendarEvent
     */
    public function setEndtime($endtime)
    {
        $this->endtime = $endtime;

        return $this;
    }

    /**
     * Get endtime
     *
     * @return string 
     */
    public function getEndtime()
    {
        return $this->endtime;
    }

    /**
     * Set creationDate
     *
     * @param \DateTime $creationDate
     * @return AxCalendarEvent
     */
    public function setCreationDate($creationDate)
    {
        $this->creationDate = $creationDate;

        return $this;
    }

    /**
     * Get creationDate
     *
     * @return \DateTime 
     */
    public function getCreationDate()
    {
        return $this->creationDate;
    }

    /**
     * Set description
     *
     * @param string $description
     * @return AxCalendarEvent
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set subject
     *
     * @param string $subject
     * @return AxCalendarEvent
     */
    public function setSubject($subject)
    {
        $this->subject = $subject;

        return $this;
    }

    /**
     * Get subject
     *
     * @return string 
     */
    public function getSubject()
    {
        return $this->subject;
    }

    /**
     * Set updateDate
     *
     * @param \DateTime $updateDate
     * @return AxCalendarEvent
     */
    public function setUpdateDate($updateDate)
    {
        $this->updateDate = $updateDate;

        return $this;
    }

    /**
     * Get updateDate
     *
     * @return \DateTime 
     */
    public function getUpdateDate()
    {
        return $this->updateDate;
    }

    /**
     * Set locked
     *
     * @param boolean $locked
     * @return AxCalendarEvent
     */
    public function setLocked($locked)
    {
        $this->locked = $locked;

        return $this;
    }

    /**
     * Get locked
     *
     * @return boolean 
     */
    public function getLocked()
    {
        return $this->locked;
    }
}
