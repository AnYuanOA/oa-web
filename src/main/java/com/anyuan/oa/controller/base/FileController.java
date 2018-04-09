package com.anyuan.oa.controller.base;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/file")
public class FileController implements InitializingBean {

    private String uploadDir;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public Map<String, Object> handleFormUpload(@RequestParam("file") MultipartFile file) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        StringBuilder serPath = new StringBuilder();
        if (!file.isEmpty()) {
            serPath = serPath.append(uploadDir).append("/").append(file.getOriginalFilename());
            File wxFile = new File(serPath.toString());
            file.transferTo(wxFile);
            map.put("filePath", file.getOriginalFilename());
        }
        return map;
    }

    @RequestMapping(value = "/{fileName:.+}", method = RequestMethod.GET)
    public void handleDownload(@PathVariable("fileName") String fileName, HttpServletResponse response) {
        StringBuilder filePath = new StringBuilder(uploadDir).append("/").append(fileName);
        File file = new File(filePath.toString());

        FileInputStream fis = null;
        OutputStream os = null;

        try {
            os = response.getOutputStream();
            fis = new FileInputStream(file);
            int count = 0;
            byte[] buffer = new byte[1024 * 8];
            while ((count = fis.read(buffer)) != -1) {
                os.write(buffer, 0, count);
                os.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fis.close();
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        String uploadDir = PropertiesLoaderUtils.loadAllProperties("jdbc.properties").getProperty("upload.dir");
        Assert.notNull(uploadDir);
        File file = new File(uploadDir);
        if (!file.exists()) {
            FileUtils.forceMkdir(file);
        }
        this.uploadDir = uploadDir;
    }


}
