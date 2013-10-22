<?php



use Doctrine\ORM\Mapping as ORM;

/**
 * LlxAxagendaCalendarEventReminder
 *
 * @ORM\Table(name="llx_axagenda_calendar_event_reminder")
 * @ORM\Entity
 */
class LlxAxagendaCalendarEventReminder
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="eventId", type="integer", nullable=false)
     */
    private $eventid;

    /**
     * @var string
     *
     * @ORM\Column(name="type", type="string", length=255, nullable=false)
     */
    private $type;

    /**
     * @var integer
     *
     * @ORM\Column(name="early", type="integer", nullable=false)
     */
    private $early;

    /**
     * @var string
     *
     * @ORM\Column(name="unit", type="string", length=255, nullable=false)
     */
    private $unit;

    /**
     * @var string
     *
     * @ORM\Column(name="alerted", type="string", length=255, nullable=false)
     */
    private $alerted;


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
     * Set eventid
     *
     * @param integer $eventid
     * @return LlxAxagendaCalendarEventReminder
     */
    public function setEventid($eventid)
    {
        $this->eventid = $eventid;

        return $this;
    }

    /**
     * Get eventid
     *
     * @return integer 
     */
    public function getEventid()
    {
        return $this->eventid;
    }

    /**
     * Set type
     *
     * @param string $type
     * @return LlxAxagendaCalendarEventReminder
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return string 
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set early
     *
     * @param integer $early
     * @return LlxAxagendaCalendarEventReminder
     */
    public function setEarly($early)
    {
        $this->early = $early;

        return $this;
    }

    /**
     * Get early
     *
     * @return integer 
     */
    public function getEarly()
    {
        return $this->early;
    }

    /**
     * Set unit
     *
     * @param string $unit
     * @return LlxAxagendaCalendarEventReminder
     */
    public function setUnit($unit)
    {
        $this->unit = $unit;

        return $this;
    }

    /**
     * Get unit
     *
     * @return string 
     */
    public function getUnit()
    {
        return $this->unit;
    }

    /**
     * Set alerted
     *
     * @param string $alerted
     * @return LlxAxagendaCalendarEventReminder
     */
    public function setAlerted($alerted)
    {
        $this->alerted = $alerted;

        return $this;
    }

    /**
     * Get alerted
     *
     * @return string 
     */
    public function getAlerted()
    {
        return $this->alerted;
    }
}
