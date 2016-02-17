/* Copyright (C) 2003 Vladimir Roubtsov. All rights reserved.
 * 
 * This program and the accompanying materials are made available under
 * the terms of the Common Public License v1.0 which accompanies this distribution,
 * and is available at http://www.eclipse.org/legal/cpl-v10.html
 * 
 * $Id: //DTV/MP_BR/DTV_X_IDTV0801_002158_10_001_158_001/android/ics-4.x/external/emma/ant/ant14/com/vladium/emma/ant/NestedTask.java#1 $
 */
package com.vladium.emma.ant;

import com.vladium.util.IProperties;

// ----------------------------------------------------------------------------
/**
 * @author Vlad Roubtsov, (C) 2003
 */
public
abstract class NestedTask extends SuppressableTask
{
    // public: ................................................................
    
    // protected: .............................................................
    
    
    protected NestedTask (final SuppressableTask parent)
    {
        if (parent == null)
            throw new IllegalArgumentException ("null input: parent");
        
        m_parent = parent;
    }

    /**
     * Overrides {@link SuppressableTask#getTaskSettings()} to mix in parent
     * task settings as the base settings. 
     */
    protected final IProperties getTaskSettings ()
    {
        final IProperties parentSettings = m_parent != null
            ? m_parent.getTaskSettings ()
            : null;
        
        final IProperties taskOverrides = super.getTaskSettings ();
        
        // task settings are always more specific than parent settings, but attention
        // needs to be paid to horizontal inheritance:
        
        if (parentSettings == null)
            return taskOverrides;
        else
        {
            final IProperties settings = IProperties.Factory.combine (taskOverrides, parentSettings);
        
            return settings;
        }
    }

    
    protected final SuppressableTask m_parent;

    // package: ...............................................................
    
    // private: ...............................................................
    
} // end of class
// ----------------------------------------------------------------------------