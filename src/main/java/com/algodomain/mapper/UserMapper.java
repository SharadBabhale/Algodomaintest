package com.algodomain.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

import com.algodomain.dto.UserDTO;
import com.algodomain.entity.User;

@Component
@Mapper(componentModel = "spring")
public interface UserMapper {

	public UserDTO toUserDTO(User user);
	
	public User toUser(UserDTO userDTO);
	
	public List<User> toUsers(List<UserDTO> userDTOs);
	
	public List<UserDTO> toUserDTOs(List<User> users);

}
