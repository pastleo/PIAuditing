package pia.httpStatus;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@ResponseStatus(value = HttpStatus.FORBIDDEN)
public class Http403 extends HttpStatusBase {}
