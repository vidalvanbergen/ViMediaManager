#tag Module
Protected Module TTsUITools
	#tag Method, Flags = &h0
		Function CtrlBottom(extends ctrl as Object) As Integer
		  return ctrl.CtrlTop + ctrl.CtrlHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlHeight(extends ctrl as Object) As Integer
		  if ctrl isA RectControl then
		    return RectControl(ctrl).Height
		  elseif ctrl isA Window then
		    return Window(ctrl).Height
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlLeft(extends ctrl as Object) As Integer
		  if ctrl isA RectControl then
		    return RectControl(ctrl).Left
		  elseif ctrl isA Window then
		    return Window(ctrl).Left
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlLockBottom(extends ctrl as Object) As Boolean
		  if ctrl isA RectControl then
		    return RectControl(ctrl).LockBottom
		  elseif ctrl isA ContainerControl then
		    return ContainerControl(ctrl).LockBottom
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlLockTop(extends ctrl as Object) As Boolean
		  if ctrl isA RectControl then
		    return RectControl(ctrl).LockTop
		  elseif ctrl isA ContainerControl then
		    return ContainerControl(ctrl).LockTop
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlParent(extends ctrl as Object) As Object
		  if ctrl isA RectControl then
		    return RectControl(ctrl).Parent
		  elseif ctrl isA ContainerControl then
		    return ContainerControl(ctrl).Parent
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlRight(extends ctrl as Object) As Integer
		  return ctrl.CtrlLeft + ctrl.CtrlWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CtrlSetLeft(extends ctrl as Object, v as Integer)
		  if ctrl isA RectControl then
		    RectControl(ctrl).Left = v
		  elseif ctrl isA Window then
		    Window(ctrl).Left = v
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CtrlSetTop(extends ctrl as Object, v as Integer)
		  if ctrl isA RectControl then
		    RectControl(ctrl).Top = v
		  elseif ctrl isA Window then
		    Window(ctrl).Top = v
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlTop(extends ctrl as Object) As Integer
		  If ctrl isA RectControl then
		    Return RectControl(ctrl).Top
		  ElseIf ctrl isA Window then
		    Return Window(ctrl).Top
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CtrlWidth(extends ctrl as Object) As Integer
		  if ctrl isA RectControl then
		    return RectControl(ctrl).Width
		  elseif ctrl isA Window then
		    return Window(ctrl).Width
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasFocus(c as ContainerControl) As Boolean
		  // finds out if any of the directly owned controls has the focus
		  // unfortunately, I can't make it search embedded containers as well - those have to be checked explicitly
		  
		  For idx as Integer = 0 to c.ControlCount-1
		    Dim ctrl as Object = c.Control(idx)
		    If c.Focus = ctrl then Return True
		  Next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize(extends container as ContainerControl, width as Integer, height as Integer)
		  dim dW, dH as Integer
		  dW = width - container.Width
		  dH = height - container.Height
		  
		  if container isA PagePanel then
		    // resizes the children automatically
		  else
		    for i as Integer = 0 to container.Window.ControlCount-1
		      dim ctrl0 as Control = container.Window.Control(i)
		      dim s as String = ctrl0.Name
		      if ctrl0 isA RectControl then
		        dim ctrl as RectControl = RectControl(ctrl0)
		        if ctrl.Parent = container then
		          dim dW2, dH2, newT, newL as Integer
		          newT = ctrl.Top
		          newL = ctrl.Left
		          if ctrl.LockRight then
		            if ctrl.LockLeft then
		              dW2 = dW
		            else
		              newL = ctrl.Left + dW
		            end
		          end
		          if ctrl.LockBottom then
		            if ctrl.LockTop then
		              dH2 = dH
		            else
		              newT = ctrl.Top + dH
		            end
		          end
		          if dW2 <> 0 or dH2 <> 0 then
		            ctrl.Resize ctrl.Width + dW2, ctrl.Height + dH2
		          end
		          ctrl.Top = newT
		          ctrl.Left = newL
		        end
		      end
		    next
		  end
		  
		  container.Width = width
		  container.Height = height
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize(extends container as RectControl, width as Integer, height as Integer)
		  dim dW, dH as Integer
		  dW = width - container.Width
		  dH = height - container.Height
		  
		  if container isA PagePanel then
		    // resizes the children automatically
		  else
		    for i as Integer = 0 to container.Window.ControlCount-1
		      dim ctrl0 as Control = container.Window.Control(i)
		      dim s as String = ctrl0.Name
		      if ctrl0 isA RectControl then
		        dim ctrl as RectControl = RectControl(ctrl0)
		        if ctrl.Parent = container then
		          dim dW2, dH2, newT, newL as Integer
		          newT = ctrl.Top
		          newL = ctrl.Left
		          if ctrl.LockRight then
		            if ctrl.LockLeft then
		              dW2 = dW
		            else
		              newL = ctrl.Left + dW
		            end
		          end
		          if ctrl.LockBottom then
		            if ctrl.LockTop then
		              dH2 = dH
		            else
		              newT = ctrl.Top + dH
		            end
		          end
		          if dW2 <> 0 or dH2 <> 0 then
		            ctrl.Resize ctrl.Width + dW2, ctrl.Height + dH2
		          end
		          ctrl.Top = newT
		          ctrl.Left = newL
		        end
		      end
		    next
		  end
		  
		  container.Width = width
		  container.Height = height
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Written mostly by Thomas Tempelmann, for the public domain
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
