#include <ruby.h>
#include <ruby/intern.h>

static VALUE
rb_obj_size(VALUE self, VALUE args, VALUE obj)
{
    return LONG2FIX(1);
}

/*!
 * Make the object invisible from Ruby code.
 *
 * It is useful to let Ruby's GC manage your internal data structure --
 * The object keeps being managed by GC, but \c ObjectSpace.each_object
 * never yields the object.
 *
 * Note that the object also lose a way to call a method on it.
 *
 * \param[in] obj a Ruby object
 * \sa rb_obj_reveal
 */
VALUE
rb_obj_hide(VALUE obj)
{
    if (!SPECIAL_CONST_P(obj)) {
	RBASIC_CLEAR_CLASS(obj);
    }
    return obj;
}

/*
 *  call-seq:
 *     obj.yield_self {|x| block }    -> an_object
 *     obj.then {|x| block }          -> an_object
 *
 *  Yields self to the block and returns the result of the block.
 *
 *     3.next.yield_self {|x| x**x }.to_s       #=> "256"
 *     "my string".yield_self {|s| s.upcase }   #=> "MY STRING"
 *
 */

static VALUE
rb_obj_yield_self(VALUE obj)
{
    RETURN_SIZED_ENUMERATOR(obj, 0, 0, rb_obj_size);
    return rb_yield_values2(1, &obj);
}

void
Init_backport_yield_self(void)
{
#undef rb_intern
#define rb_intern(str) rb_intern_const(str)

    rb_mKernel = rb_define_module("Kernel");

    rb_define_method(rb_mKernel, "yield_self", rb_obj_yield_self, 0);
    rb_define_method(rb_mKernel, "then", rb_obj_yield_self, 0);
}
