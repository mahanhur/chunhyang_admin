package com.chflower;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Slf4j
@SpringBootTest
class chunhyangadminApplicationTests {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Test
    void contextLoads() {
        String rawPassword = "pwd01";
        String encPassword = encoder.encode(rawPassword);
        log.info("암호화 된 비번" + encPassword);
        boolean result = encoder.matches(rawPassword,encPassword);
        log.info(result+"");
    }
}
