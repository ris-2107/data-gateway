package com.ris.datagateway;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController()
@RequestMapping("/data-gateway")
public class DataGatewayLauncher {
    @GetMapping("/get-redis-config")
    String getRedisGatewayConfig(){
        return "REDIS_CONFIG#HOST=";
    }

}
