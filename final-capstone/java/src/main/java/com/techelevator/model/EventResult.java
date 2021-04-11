package com.techelevator.model;

public class EventResult {
    private Long resultId;
    private Long eventId;
    private Long choice1Result;
    private Long choice2Result;
    private Long choice3Result;
    private Long choice4Result;
    private Long choice5Result;


    public EventResult(Long resultId, Long eventId, Long choice1Result, Long choice2Result, Long choice3Result,
                       Long choice4Result, Long choice5Result) {
        this.resultId = resultId;
        this.eventId = eventId;
        this.choice1Result = choice1Result;
        this.choice2Result = choice2Result;
        this.choice3Result = choice3Result;
        this.choice4Result = choice4Result;
        this.choice5Result = choice5Result;
    }
    public EventResult(){}

    public Long getResultId() {
        return resultId;
    }

    public void setResultId(Long resultId) {
        this.resultId = resultId;
    }

    public Long getEventId() {
        return eventId;
    }

    public void setEventId(Long eventId) {
        this.eventId = eventId;
    }

    public Long getChoice1Result() {
        return choice1Result;
    }

    public void setChoice1Result(Long choice1Result) {
        this.choice1Result = choice1Result;
    }

    public Long getChoice2Result() {
        return choice2Result;
    }

    public void setChoice2Result(Long choice2Result) {
        this.choice2Result = choice2Result;
    }

    public Long getChoice3Result() {
        return choice3Result;
    }

    public void setChoice3Result(Long choice3Result) {
        this.choice3Result = choice3Result;
    }

    public Long getChoice4Result() {
        return choice4Result;
    }

    public void setChoice4Result(Long choice4Result) {
        this.choice4Result = choice4Result;
    }

    public Long getChoice5Result() {
        return choice5Result;
    }

    public void setChoice5Result(Long choice5Result) {
        this.choice5Result = choice5Result;
    }
}
