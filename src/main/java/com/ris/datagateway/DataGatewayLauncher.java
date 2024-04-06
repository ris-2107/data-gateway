package com.ris.datagateway;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController()
@RequestMapping("/data-gateway")
public class DataGatewayLauncher {

    @Value("${REDIS_HOST}")
    private String redisHost;
    @GetMapping("/get-redis-config")
    public Map<String, String> getRedisGatewayConfig() {
        Map<String, String> redisConfig = new HashMap<>();
        redisConfig.put("redis_host", redisHost);
        // Add other key-value pairs as needed
        return redisConfig;
    }
}
