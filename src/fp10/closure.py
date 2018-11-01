def apply_2args_2freevars(closure, arg1, arg2):
      a_function_implementation, fv1, fv2 = closure
      return a_function_implementation(arg1, arg2, fv1, fv2)

def f_implementation(x, y, a, b):
  return a * x + b * y

a = 3
b = 4
closure = (f_implementation, a, b)
print("Closure-call: {}\n".format(apply_2args_2freevars(closure, 5, 6)))
