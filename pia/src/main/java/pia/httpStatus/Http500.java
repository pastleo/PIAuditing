package pia.httpStatus;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
public class Http500 extends HttpStatusBase {}
