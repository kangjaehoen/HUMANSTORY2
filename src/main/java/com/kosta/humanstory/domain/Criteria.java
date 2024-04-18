package com.kosta.humanstory.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Setter
@Getter
public class Criteria {

    private int pageNum;
    private int amount;

    public Criteria() {
        this(1, 10 );
    }

    public Criteria(int pageNum, int amount) {
        super();
        this.pageNum = pageNum;
        this.amount = amount;

    }


}
