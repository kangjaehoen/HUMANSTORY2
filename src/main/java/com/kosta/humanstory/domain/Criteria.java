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


    private String type;
    private String keyword;

    public Criteria() {
        this(1, 10 );
    }

    public Criteria(int pageNum, int amount) {
        super();
        this.pageNum = pageNum;
        this.amount = amount;

    }


    public String[] getTypeArr() {

        return type == null ? new String[] {} : type.split("");
    }
}
