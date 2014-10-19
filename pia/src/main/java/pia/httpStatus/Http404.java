package pia.httpStatus;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class Http404 extends HttpStatusBase {}
