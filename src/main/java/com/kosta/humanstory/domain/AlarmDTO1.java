package com.kosta.humanstory.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AlarmDTO1 {
    private int idx;
    private String empNum;
    private String code;
    private String checked;
    private String prefix;
}
