package com.anyuan.oa.controller.base;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
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

    @RequestMapping(value = "download", method = RequestMethod.GET)
    public ResponseEntity<byte[]> handleDownload(@RequestParam("name") String fileName) throws IOException {
        StringBuilder filePath = new StringBuilder(uploadDir).append("/").append(fileName);
        File file = new File(filePath.toString());
        HttpHeaders headers = new HttpHeaders();
        //下载显示的文件名，解决中文名称乱码问题
        String downloadFileName = new String(file.getName().getBytes("UTF-8"), "iso-8859-1");
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("inline", downloadFileName);
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.OK);
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
