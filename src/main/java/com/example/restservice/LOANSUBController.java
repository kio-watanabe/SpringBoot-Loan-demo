package com.example.restservice;
import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import jp.osscons.opensourcecobol.libcobj.ui.*;

@RestController
public class LOANSUBController {
    @GetMapping("/LOANSUB")
    public LOANSUBRecord LOANSUBController(
        @RequestParam(value = "LK_LOAN", defaultValue = "0") int LK_LOAN,
        @RequestParam(value = "LK_INTEREST_RATE", defaultValue = "0") double LK_INTEREST_RATE,
        @RequestParam(value = "LK_PERIODS", defaultValue = "0") int LK_PERIODS,
        @RequestParam(value = "LK_PAYMENT", defaultValue = "0") int LK_PAYMENT
    ) {
        int statuscode = 200;
        LOANSUB LOANSUBCobol = new LOANSUB();
        CobolResultSet result = LOANSUBCobol.execute(LK_LOAN, LK_INTEREST_RATE, LK_PERIODS, LK_PAYMENT);
        try {
            LK_LOAN = result.getInt(1);
            LK_INTEREST_RATE = result.getDouble(2);
            LK_PERIODS = result.getInt(3);
            LK_PAYMENT = result.getInt(4);
        } catch (Exception e) {
            statuscode = 500;
        }
        return new LOANSUBRecord(statuscode, LK_LOAN, LK_INTEREST_RATE, LK_PERIODS, LK_PAYMENT);
    }
}
