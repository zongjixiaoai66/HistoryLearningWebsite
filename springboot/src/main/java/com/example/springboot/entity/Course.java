package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import cn.hutool.core.annotation.Alias;

/**
 * <p>
 *
 * </p>
 *
 * @author
 *
 */
@Getter
@Setter
@ApiModel(value = "Course对象", description = "")
public class Course implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("名称")
    @Alias("名称")
    private String name;

    @ApiModelProperty("备注")
    @Alias("备注")
    private String remark;

    @ApiModelProperty("文件名称")
    @Alias("文件名称")
    private String filename;

    @ApiModelProperty("文件大小(kb)")
    @Alias("文件大小(kb)")
    private Long filesize;

    @ApiModelProperty("下载链接")
    @Alias("下载链接")
    private String fileurl;

    @ApiModelProperty("文件md5")
    @Alias("文件md5")
    private String md5;


}
