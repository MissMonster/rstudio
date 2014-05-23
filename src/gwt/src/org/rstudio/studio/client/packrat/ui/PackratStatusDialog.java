/* PackratStatusDialog.java
 *
 * Copyright (C) 2014 by RStudio, Inc.
 *
 * Unless you have received this program directly from RStudio pursuant
 * to the terms of a commercial license agreement with RStudio, then
 * this program is licensed to you under the terms of version 3 of the
 * GNU Affero General Public License. This program is distributed WITHOUT
 * ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING THOSE OF NON-INFRINGEMENT,
 * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. Please refer to the
 * AGPL (http://www.gnu.org/licenses/agpl-3.0.txt) for more details.
 *
 */

package org.rstudio.studio.client.packrat.ui;
import org.rstudio.core.client.widget.ModalDialogBase;
import org.rstudio.core.client.widget.ThemedButton;

import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.Widget;

public class PackratStatusDialog extends ModalDialogBase
{
   public PackratStatusDialog()
   {
      setText("Packrat Project Status");
      ThemedButton OKButton = new ThemedButton("OK", 
         new ClickHandler() 
      {
            @Override
            public void onClick(ClickEvent event) {
               closeDialog();
            }
      });
      addOkButton(OKButton);
      contents_ = new PackratStatusDialogContents();
      setWidth("600px");
   }

   @Override
   protected Widget createMainWidget()
   {
      return contents_;
   }
   
   private PackratStatusDialogContents contents_;
}
