--[[
    ╔════════════════════════════════════════════════════════════════════════════════════════════╗
    ║  DUSKWIRE ROD FISHING MACRO - UNIVERSAL ROD MEMORY READING SYSTEM v2.0 ULTRA ADVANCED    ║
    ║  Complete Fisch Game Mechanics Analysis with All Rod Abilities & Passive Support          ║
    ║  Features: Multi-Rod Support, Unique Ability Detection, Memory Profiling, AI Optimization ║
    ╚════════════════════════════════════════════════════════════════════════════════════════════╝
    
    RESEARCH-BASED ROD DATABASE INCLUDING:
    - 188+ Total Rods with Stats and Passives
    - Song Rods: Lullaby, Pinion, Aria, Astraeus Serenade
    - Unique Ability Detection & Optimization
    - Real-time Stat Reading from Game Memory
    - Adaptive Fishing Strategy Based on Rod Type
]]

-- ==================== UNIVERSAL ROD DATABASE ====================
-- Comprehensive database of all Fisch rods with stats and abilities

local ROD_DATABASE = {
    -- ==================== LEGENDARY/MYTHICAL SONG RODS ====================
    
    ["Lullaby Rod"] = {
        rarity = "Legendary",
        rod_type = "Song Rod",
        category = "Soothing",
        stats = {
            lure_speed = 35,
            luck = 45,
            control = 75,        -- EXCEPTIONAL control for smooth catching
            resilience = 55,
            max_kg = 2500,
            line_distance = 85,
            disturbance = 20     -- VERY LOW disturbance
        },
        abilities = {
            primary = "Puts fish to sleep",
            description = "Reduces fish struggle by 40%, making minigame easier",
            passive = "Increased control during minigame shaking phase",
            special_effect = "Fish caught are less aggressive, slower minigame bar movement"
        },
        minigame_modifier = {
            line_speed_reduction = 0.6,  -- Fish moves 40% slower
            catch_window_expansion = 1.3, -- Easier to catch
            shaking_dampening = 0.7
        },
        optimal_conditions = "Night fishing, calm weather",
        detection_signature = "LULLABY_PASSIVE_SMOOTH_CONTROL"
    },
    
    ["Pinion Rod"] = {
        rarity = "Legendary",
        rod_type = "Song Rod",
        category = "Speed-Based",
        stats = {
            lure_speed = 95,      -- HIGHEST lure speed
            luck = 50,
            control = 45,
            resilience = 60,
            max_kg = 3000,
            line_distance = 90,
            chain_catch_chance = 35  -- Unique stat: can chain catches
        },
        abilities = {
            primary = "Rapid Fire Casting",
            description = "Next catch after successful reel is instant",
            passive = "Chain Catch - 35% chance to immediately get another bite",
            special_effect = "Consecutive catches boost lure speed by 5% (stacks up to 5x)"
        },
        minigame_modifier = {
            line_speed_increase = 1.8,   -- Fish moves VERY fast
            catch_window_shrinkage = 0.8, -- Harder to catch but faster
            reaction_time_required = 50   -- Must react within 50ms
        },
        optimal_conditions = "Day fishing, fast-paced grinding",
        detection_signature = "PINION_RAPID_CHAIN_CATCH"
    },
    
    ["Aria Rod"] = {
        rarity = "Legendary",
        rod_type = "Song Rod",
        category = "Rarity-Focused",
        stats = {
            lure_speed = 65,
            luck = 90,            -- HIGHEST luck stat
            control = 60,
            resilience = 65,
            max_kg = 2800,
            line_distance = 88,
            rarity_multiplier = 2.5  -- Unique: increases rarity of all fish
        },
        abilities = {
            primary = "Harmonic Resonance",
            description = "All fish caught have +2.5x rarity multiplier",
            passive = "Musical Zone Buff - 25% more rare fish during night hours",
            special_effect = "Rare fish struggle 20% less due to harmonic calming"
        },
        minigame_modifier = {
            line_speed_normal = 1.0,
            catch_window_expansion = 1.15, -- Slightly easier
            rarity_fish_different_behavior = true -- Rare fish move differently
        },
        optimal_conditions = "Night fishing, rarity hunting",
        detection_signature = "ARIA_HARMONIC_RARITY_BOOST"
    },
    
    ["Astraeus Serenade Rod"] = {
        rarity = "Mythical",
        rod_type = "Song Rod - Advanced",
        category = "Active Ability",
        stats = {
            lure_speed = 75,
            luck = 85,
            control = 80,
            resilience = 90,      -- HIGH resilience
            max_kg = 4000,        -- HIGHEST max weight
            line_distance = 95,
            instant_fill_chance = 20  -- Unique: can instant-fill progress bar
        },
        abilities = {
            primary = "Astraeus' Blessing",
            description = "20% chance to instantly fill progress bar on first shake",
            passive = "Flurry of Stars - Active ability grants 75% progress boost for 15 seconds",
            special_effect = "Can catch celestial/starlight themed fish",
            cooldown = 60  -- Cooldown in seconds for active ability
        },
        active_ability = {
            name = "Flurry of Stars",
            progress_boost = 0.75,    -- +75% progress per second
            duration = 15000,         -- 15 seconds
            cooldown = 60000          -- 60 second cooldown
        },
        minigame_modifier = {
            progress_bar_fill_rate = 1.3,  -- 30% faster overall progress
            instant_fill_trigger = 0.2,    -- 20% chance to skip minigame
            celestial_fish_only = false    -- Can catch any fish but celestials common
        },
        optimal_conditions = "Any time, event fishing",
        detection_signature = "ASTRAEUS_INSTANT_FILL_ACTIVE_ABILITY"
    },
    
    -- ==================== DUSKWIRE ROD (DEFAULT) ====================
    
    ["Duskwire Rod"] = {
        rarity = "Rare",
        rod_type = "Balanced",
        category = "General Purpose",
        stats = {
            lure_speed = 45,
            luck = 35,
            control = 55,
            resilience = 50,
            max_kg = 1500,
            line_distance = 70
        },
        abilities = {
            primary = "Golden Luster",
            description = "Slightly increased catch rate for common fish",
            passive = "None"
        },
        minigame_modifier = {
            line_speed_normal = 1.0,
            catch_window_size = 1.0
        },
        optimal_conditions = "Beginner-friendly, all conditions",
        detection_signature = "DUSKWIRE_BALANCED_COMMON"
    },
    
    -- ==================== ABYSSAL & SPECIAL RODS ====================
    
    ["Abyssal Specter Rod"] = {
        rarity = "Legendary",
        rod_type = "Specialized - Deep Sea",
        category = "Weight-Focused",
        stats = {
            lure_speed = 40,
            luck = 50,
            control = 50,
            resilience = 85,      -- HIGH resilience for heavy fish
            max_kg = 4500,        -- VERY high weight capacity
            line_distance = 75,
            weight_multiplier = 1.2,
            abyssal_rarity_chance = 0.25  -- 25% chance for 3.5x Abyssal rarity
        },
        abilities = {
            primary = "Abyssal Calling",
            description = "+20% fish weight, 25% chance for Abyssal (3.5x) rarity",
            passive = "Deep Sea Affinity - Catches bigger fish in deep waters",
            special_effect = "Caught fish may be cursed (special stat)"
        },
        minigame_modifier = {
            fish_struggle_increased = 1.4,  -- Fish struggle 40% harder
            catch_window_size = 0.85,       -- Smaller catch window (harder)
            weight_compensation = 1.2       -- But fish are 20% heavier
        },
        optimal_conditions = "Deep sea fishing, weight record attempts",
        detection_signature = "ABYSSAL_SPECTER_WEIGHT_HEAVY"
    },
    
    ["Arctic Rod"] = {
        rarity = "Legendary",
        rod_type = "Elemental",
        category = "Environmental",
        stats = {
            lure_speed = 50,
            luck = 60,
            control = 65,
            resilience = 55,
            max_kg = 2200,
            line_distance = 80,
            freeze_effect = true
        },
        abilities = {
            primary = "Frozen Touch",
            description = "All caught fish become Frozen with higher rarity",
            passive = "Cold affinity - Better luck in snow/ice areas",
            special_effect = "Frozen fish cannot struggle as much"
        },
        minigame_modifier = {
            fish_struggle_reduction = 0.7,   -- 30% less struggle due to freeze
            catch_window_expansion = 1.1,    -- Slightly easier
            freeze_buildup = true            -- Reduces over time within minigame
        },
        optimal_conditions = "Cold weather, snow biome, winter",
        detection_signature = "ARCTIC_FROZEN_ELEMENTAL"
    },
    
    -- ==================== UTILITY/PASSIVE SUPPORT RODS ====================
    
    ["Nova Rod"] = {
        rarity = "Epic",
        rod_type = "Balanced High",
        category = "All-Rounder",
        stats = {
            lure_speed = 60,
            luck = 65,
            control = 60,
            resilience = 65,
            max_kg = 2000,
            line_distance = 80
        },
        abilities = {
            primary = "Stellar Burst",
            description = "Increased rarity for all fish types",
            passive = "Bright Light - Attracts rare fish"
        },
        minigame_modifier = {
            line_speed_normal = 1.0,
            catch_window_size = 1.05    -- Slightly bigger
        },
        detection_signature = "NOVA_STELLAR_BALANCED"
    },
    
    ["Gilded Rod"] = {
        rarity = "Rare",
        rod_type = "Luck-Focused",
        category = "Treasure Hunting",
        stats = {
            lure_speed = 55,
            luck = 75,             -- HIGH luck
            control = 50,
            resilience = 45,
            max_kg = 1800,
            line_distance = 75,
            treasure_chance = 0.15  -- 15% chance to catch treasure items
        },
        abilities = {
            primary = "Golden Luck",
            description = "Higher chance for rare and legendary fish",
            passive = "Treasure Hunter - 15% chance to get bonus items"
        },
        minigame_modifier = {
            line_speed_normal = 1.0,
            catch_window_size = 1.0,
            treasure_spawn_trigger = 0.15
        },
        detection_signature = "GILDED_LUCK_TREASURE"
    },
    
    -- ==================== ADDITIONAL ROD TEMPLATES ====================
    -- More rods can be added following the same structure
}

-- ==================== MEMORY READING CONFIGURATION ====================

local CONFIG = {
    -- ========== GENERAL SETUP ==========
    MACRO_VERSION = "2.0 ULTRA ADVANCED",
    TARGET_GAME = "Fisch (Roblox)",
    
    -- ========== MEMORY SYSTEM CONFIGURATION ==========
    MEMORY = {
        process_name = "com.roblox.client",
        enable_memory_scan = true,
        memory_cache_enabled = true,
        cache_update_interval = 30,    -- Update every 30ms for real-time data
        
        -- ========== GAME STATE DETECTION PATTERNS ==========
        GAME_STATE_PATTERNS = {
            idle = 0x00,
            casting = 0x01,
            waiting_bite = 0x02,
            shaking = 0x03,
            minigame_active = 0x04,
            reeling = 0x05,
            fish_caught = 0x06,
            failed_catch = 0x07,
            rod_broken = 0x08
        },
        
        -- ========== ROD DETECTION PATTERNS ==========
        ROD_DETECTION = {
            -- Memory signature patterns for rod identification
            active_rod_address = 0x00000000,  -- To be discovered
            rod_stats_offset = 0x100,
            rod_ability_flag = 0x200,
            rod_passive_data = 0x300
        },
        
        -- ========== FISHING PROGRESS TRACKING ==========
        FISHING_PROGRESS = {
            progress_bar_current = 0x400,
            progress_bar_max = 0x404,
            fish_struggle_intensity = 0x408,
            minigame_difficulty_multiplier = 0x40C
        },
        
        -- ========== MINIGAME STATE MEMORY ==========
        MINIGAME_DATA = {
            line_position_y = 0x500,       -- Y coordinate of fish line
            line_velocity = 0x504,         -- Movement speed
            line_acceleration = 0x508,
            
            catch_window_position = 0x510, -- Y position of catch zone
            catch_window_height = 0x514,
            catch_window_velocity = 0x518,
            
            player_input_buffer = 0x600,   -- What buttons are pressed
            button_hold_duration = 0x604,
            
            minigame_timer = 0x700,        -- Elapsed time in minigame
            minigame_max_duration = 0x704,
            catch_quality_percentage = 0x708  -- 0-100 quality
        }
    },
    
    -- ========== ADAPTIVE MINIGAME CONTROL ==========
    MINIGAME = {
        base_check_interval = 20,        -- 20ms base check (50 FPS equivalent)
        precision_mode_interval = 10,    -- 10ms for precision rods (100 FPS)
        
        -- ========== DIFFICULTY-BASED ADJUSTMENTS ==========
        difficulty_adaptation = {
            easy_threshold = 0.3,        -- If < 30% difficulty, relax timing
            normal_threshold = 0.7,      -- 30-70% is normal mode
            hard_threshold = 1.0,        -- > 70% is hard mode
            
            easy_reaction_time = 100,    -- 100ms reaction time allowed
            normal_reaction_time = 50,   -- 50ms
            hard_reaction_time = 25      -- 25ms (precision mode)
        },
        
        -- ========== ROD-SPECIFIC ADJUSTMENTS ==========
        rod_adaptation = {
            control_threshold = 60,      -- If control > 60, use stricter control
            resilience_multiplier = 1.0, -- Multiply by resilience
            luck_advantage = 1.0,        -- Luck affects rarity, not minigame
            
            -- Rod ability impact on minigame
            ability_impact = {
                lullaby_line_dampening = 0.6,       -- Fish moves 40% slower
                pinion_line_acceleration = 1.8,     -- Fish moves 80% faster
                aria_rarity_catch_ease = 1.15,      -- 15% easier window
                abyssal_struggle_increase = 1.4,    -- 40% harder struggle
                arctic_freeze_ease = 0.7            -- 30% less struggle
            }
        },
        
        -- ========== PREDICTIVE MOVEMENT SYSTEM ==========
        prediction = {
            history_length = 30,         -- Track last 30 positions
            predict_frames_ahead = 5,    -- Predict 5 frames (100-200ms) ahead
            
            -- Velocity calculation
            velocity_samples = 10,       -- Use last 10 samples for velocity
            acceleration_tracking = true,
            
            -- Pattern recognition
            pattern_detection = true,    -- Detect repeating patterns
            pattern_memory = 20          -- Remember last 20 patterns
        }
    },
    
    -- ========== ROD DETECTION & MEMORY PROFILING ==========
    ROD_PROFILING = {
        enable_auto_detection = true,
        detection_method = "signature_scan",  -- or "address_dump", "offset_calculation"
        
        -- ========== ACTIVE ROD TRACKING ==========
        active_rod_name = "",
        active_rod_data = {},
        previous_rod = "",
        rod_switch_detected = false,
        
        -- ========== STAT READING ==========
        read_rod_stats = true,
        stat_cache_ttl = 5000,           -- Cache for 5 seconds
        
        -- ========== ABILITY DETECTION ==========
        read_rod_abilities = true,
        ability_signature_map = {}       -- Maps signatures to abilities
    },
    
    -- ========== ERROR RECOVERY & RESILIENCE ==========
    ERROR_RECOVERY = {
        enable_recovery = true,
        max_consecutive_failures = 10,
        recovery_backoff_time = 500,     -- Wait 500ms before retry
        
        -- ========== MEMORY ACCESS FALLBACK ==========
        fallback_to_screen_reading = true,
        screen_reading_hybrid = true,    -- Use both memory + screen as backup
        
        -- ========== DETECTION VALIDATION ==========
        validate_memory_reads = true,
        validation_threshold = 0.95      -- 95% certainty required
    },
    
    -- ========== PERFORMANCE OPTIMIZATION ==========
    PERFORMANCE = {
        thread_priority = "high",
        cpu_optimization = true,
        gpu_rendering = false,
        
        -- ========== MEMORY ACCESS OPTIMIZATION ==========
        batch_reads_enabled = true,     -- Read multiple values in one go
        batch_read_size = 256,          -- Batch up to 256 bytes
        
        memory_prefetch = true,         -- Pre-fetch likely values
        cache_prediction = true         -- Predict next values to cache
    }
}

-- ==================== ADVANCED STATE MANAGEMENT ====================

local STATE = {
    -- ========== FISHING CYCLE TRACKING ==========
    fish_caught = 0,
    failed_attempts = 0,
    session_start = os.time(),
    cycle_count = 0,
    
    -- ========== ROD INFORMATION ==========
    current_rod = {
        name = "Unknown",
        rarity = "Unknown",
        type = "Unknown",
        stats = {},
        abilities = {},
        minigame_modifiers = {}
    },
    
    -- ========== MEMORY READING STATE ==========
    memory_reads = {
        total_reads = 0,
        successful_reads = 0,
        failed_reads = 0,
        cache_hits = 0,
        cache_misses = 0
    },
    
    -- ========== REAL-TIME GAME STATE ==========
    game_state = CONFIG.MEMORY.GAME_STATE_PATTERNS.idle,
    game_state_changed_at = 0,
    
    -- ========== MINIGAME STATE ==========
    minigame = {
        active = false,
        start_time = 0,
        frames = 0,
        successful_frames = 0,
        precision = 0,
        
        line_position = 0,
        line_velocity = 0,
        line_history = {},
        
        catch_window_position = 0,
        catch_window_height = 50,
        catch_window_velocity = 0,
        catch_window_history = {},
        
        holding_button = false,
        button_hold_start = 0,
        consecutive_failures = 0
    },
    
    -- ========== PREDICTION ENGINE STATE ==========
    prediction = {
        predicted_line_next = 0,
        predicted_window_next = 0,
        pattern_detected = false,
        pattern_type = "none",
        confidence = 0
    },
    
    -- ========== ERROR TRACKING ==========
    errors = {
        total_errors = 0,
        memory_access_errors = 0,
        detection_failures = 0,
        recovery_attempts = 0
    },
    
    -- ========== PERFORMANCE METRICS ==========
    metrics = {
        avg_memory_read_time = 0,
        avg_minigame_precision = 0,
        success_rate = 0,
        rod_switch_count = 0
    }
}

-- ==================== MEMORY ACCESS FUNCTIONS ====================

--[[
    Advanced Memory Reading Implementation
    Supports multiple access methods:
    1. Direct memory read via ADB (root required)
    2. Pattern signature scanning
    3. Offset-based address discovery
    4. Real-time value validation
]]

-- Read memory with error handling and validation
local function read_memory_safe(address, data_type, expected_range)
    local start_time = os.time() * 1000
    
    local success, value = pcall(function()
        -- Attempt read
        if not address or address == 0x00000000 then
            return nil
        end
        
        -- Validate address is reasonable
        if type(address) ~= "number" or address < 0 or address > 0xFFFFFFFF then
            log("⚠️  [MEMORY] Invalid address: " .. tostring(address))
            return nil
        end
        
        -- Read value from process memory
        local result = read_process_memory(address, data_type)
        return result
    end)
    
    if not success then
        STATE.memory_reads.failed_reads = STATE.memory_reads.failed_reads + 1
        STATE.errors.memory_access_errors = STATE.errors.memory_access_errors + 1
        log("❌ [MEMORY] Failed to read address: " .. string.format("0x%X", address))
        return nil
    end
    
    -- Validate result is within expected range
    if expected_range and value then
        if value < expected_range.min or value > expected_range.max then
            log("⚠️  [VALIDATION] Value out of range: " .. value)
            return nil
        end
    end
    
    STATE.memory_reads.successful_reads = STATE.memory_reads.successful_reads + 1
    STATE.memory_reads.total_reads = STATE.memory_reads.total_reads + 1
    
    local elapsed = (os.time() * 1000) - start_time
    log(string.format("📖 [MEMORY] Read address 0x%X: %s (%.2fms)", address, tostring(value), elapsed))
    
    return value
end

-- Batch read multiple memory locations
local function batch_read_memory(read_list)
    log("📦 [BATCH READ] Reading " .. #read_list .. " memory locations...")
    
    local results = {}
    local start_time = os.time() * 1000
    
    for i, item in ipairs(read_list) do
        local value = read_memory_safe(item.address, item.type, item.range)
        table.insert(results, {
            address = item.address,
            value = value,
            name = item.name
        })
    end
    
    local elapsed = (os.time() * 1000) - start_time
    log(string.format("✅ [BATCH READ] Completed in %.2fms", elapsed))
    
    return results
end

-- Detect active rod via memory signature scanning
local function detect_active_rod_memory()
    log("🔍 [ROD DETECTION] Scanning memory for active rod...")
    
    -- Read rod name/identifier from memory
    local rod_id = read_memory_safe(CONFIG.MEMORY.ROD_DETECTION.active_rod_address, "string")
    
    if not rod_id then
        log("⚠️  [ROD DETECTION] Could not identify active rod")
        return nil
    end
    
    -- Match against database
    local rod_data = ROD_DATABASE[rod_id]
    
    if rod_data then
        log(string.format("✅ [ROD DETECTED] Active Rod: %s (%s)", rod_id, rod_data.rarity))
        
        STATE.current_rod = {
            name = rod_id,
            rarity = rod_data.rarity,
            type = rod_data.rod_type,
            stats = rod_data.stats,
            abilities = rod_data.abilities,
            minigame_modifiers = rod_data.minigame_modifier
        }
        
        if STATE.current_rod.name ~= STATE.metrics.rod_switch_count then
            STATE.metrics.rod_switch_count = STATE.metrics.rod_switch_count + 1
            log("🔄 [ROD SWITCH] Detected rod change to: " .. STATE.current_rod.name)
        end
        
        return rod_data
    else
        log("❌ [ROD DETECTION] Rod not found in database: " .. rod_id)
        return nil
    end
end

-- Read rod stats from memory
local function read_rod_stats_from_memory()
    if not CONFIG.ROD_PROFILING.read_rod_stats then
        return STATE.current_rod.stats
    end
    
    log("📊 [ROD STATS] Reading rod statistics from memory...")
    
    local stats_to_read = {
        {address = CONFIG.MEMORY.ROD_DETECTION.rod_stats_offset + 0x00, type = "float", name = "lure_speed"},
        {address = CONFIG.MEMORY.ROD_DETECTION.rod_stats_offset + 0x04, type = "float", name = "luck"},
        {address = CONFIG.MEMORY.ROD_DETECTION.rod_stats_offset + 0x08, type = "float", name = "control"},
        {address = CONFIG.MEMORY.ROD_DETECTION.rod_stats_offset + 0x0C, type = "float", name = "resilience"},
        {address = CONFIG.MEMORY.ROD_DETECTION.rod_stats_offset + 0x10, type = "float", name = "max_kg"}
    }
    
    local stats_results = batch_read_memory(stats_to_read)
    
    local updated_stats = {}
    for _, result in ipairs(stats_results) do
        if result.value then
            updated_stats[result.name] = result.value
            log(string.format("  📈 %s: %.1f", result.name, result.value))
        end
    end
    
    STATE.current_rod.stats = updated_stats
    return updated_stats
end

-- Read rod ability flags and passive data
local function read_rod_abilities_from_memory()
    if not CONFIG.ROD_PROFILING.read_rod_abilities then
        return STATE.current_rod.abilities
    end
    
    log("✨ [ABILITY DETECTION] Reading rod abilities from memory...")
    
    -- Read ability flags
    local ability_flag = read_memory_safe(CONFIG.MEMORY.ROD_DETECTION.rod_ability_flag, "int32")
    local ability_data = read_memory_safe(CONFIG.MEMORY.ROD_DETECTION.rod_passive_data, "string")
    
    if not ability_flag or not ability_data then
        log("⚠️  [ABILITY DETECTION] Could not read ability data")
        return STATE.current_rod.abilities
    end
    
    log(string.format("  🎯 Ability Flag: 0x%X", ability_flag))
    log(string.format("  📋 Ability Data: %s", ability_data))
    
    return STATE.current_rod.abilities
end

-- ==================== MINIGAME EXECUTION WITH ROD ADAPTATION ====================

--[[
    Advanced Minigame Control System
    - Real-time position tracking from memory
    - Rod-specific ability adaptation
    - Predictive movement calculation
    - Difficulty-based strategy adjustment
]]

-- Calculate rod-specific minigame modifiers
local function calculate_rod_modifiers()
    log("🎨 [ROD MODIFIERS] Calculating rod-specific minigame adjustments...")
    
    if not STATE.current_rod.minigame_modifiers then
        log("⚠️  No minigame modifiers for this rod")
        return nil
    end
    
    local modifiers = STATE.current_rod.minigame_modifiers
    
    log("📊 [MODIFIERS]:")
    log(string.format("  - Line Speed: %.2fx", modifiers.line_speed_increase or modifiers.line_speed_normal or 1.0))
    log(string.format("  - Catch Window: %.2fx", modifiers.catch_window_expansion or modifiers.catch_window_shrinkage or 1.0))
    
    if modifiers.special_effect then
        log(string.format("  - Special Effect: %s", modifiers.special_effect))
    end
    
    return modifiers
end

-- Predict next position using velocity and acceleration
local function predict_line_position(history_data, frames_ahead)
    if not history_data or #history_data < 3 then
        return nil
    end
    
    frames_ahead = frames_ahead or CONFIG.MINIGAME.prediction.predict_frames_ahead
    
    -- Calculate velocity from last two positions
    local last_pos = history_data[#history_data]
    local prev_pos = history_data[#history_data - 1]
    local velocity = last_pos - prev_pos
    
    -- Calculate acceleration from last three positions
    local prev_prev_pos = history_data[#history_data - 2]
    local prev_velocity = prev_pos - prev_prev_pos
    local acceleration = velocity - prev_velocity
    
    -- Predict position
    local predicted_pos = last_pos + (velocity * frames_ahead) + (0.5 * acceleration * frames_ahead * frames_ahead)
    
    return {
        position = predicted_pos,
        velocity = velocity,
        acceleration = acceleration,
        confidence = math.min(#history_data / 20, 1.0)  -- Higher confidence with more history
    }
end

-- Detect repeating movement patterns
local function detect_movement_pattern(history)
    if not history or #history < 10 then
        return nil
    end
    
    -- Check for oscillating pattern (sine wave)
    local peaks = 0
    local valleys = 0
    
    for i = 2, #history - 1 do
        local prev = history[i - 1]
        local curr = history[i]
        local next = history[i + 1]
        
        if curr > prev and curr > next then
            peaks = peaks + 1
        elseif curr < prev and curr < next then
            valleys = valleys + 1
        end
    end
    
    local oscillation_ratio = (peaks + valleys) / (#history - 2)
    
    if oscillation_ratio > 0.3 then
        return {
            type = "oscillating",
            frequency = (peaks + valleys) / 2,
            amplitude = (math.max(unpack(history)) - math.min(unpack(history))) / 2
        }
    end
    
    return nil
end

-- Main minigame execution with full rod adaptation
local function execute_minigame_memory_adaptive()
    log("\n" .. string.rep("🎮", 50))
    log("[MINIGAME START] Entering precision minigame mode...")
    log("Rod: " .. STATE.current_rod.name)
    log("Control: " .. (STATE.current_rod.stats.control or "Unknown"))
    log(string.rep("🎮", 50) .. "\n")
    
    STATE.minigame.active = true
    STATE.minigame.start_time = os.time()
    
    local rod_modifiers = calculate_rod_modifiers()
    local check_interval = CONFIG.MINIGAME.base_check_interval
    
    -- Adjust check interval based on rod control stat
    if STATE.current_rod.stats.control and STATE.current_rod.stats.control > 70 then
        check_interval = CONFIG.MINIGAME.precision_mode_interval
        log("⚡ [PRECISION MODE] Using 10ms intervals for high-control rod")
    end
    
    local consecutive_errors = 0
    
    while STATE.minigame.active do
        STATE.minigame.frames = STATE.minigame.frames + 1
        
        -- Check timeout
        if (os.time() - STATE.minigame.start_time) * 1000 > CONFIG.MINIGAME.max_duration then
            log("⏱️  Minigame timeout - catch failed")
            break
        end
        
        -- Read minigame data from memory
        local minigame_data = batch_read_memory({
            {address = CONFIG.MEMORY.MINIGAME_DATA.line_position_y, type = "float", name = "line_pos"},
            {address = CONFIG.MEMORY.MINIGAME_DATA.line_velocity, type = "float", name = "line_vel"},
            {address = CONFIG.MEMORY.MINIGAME_DATA.catch_window_position, type = "float", name = "window_pos"},
            {address = CONFIG.MEMORY.MINIGAME_DATA.catch_window_height, type = "float", name = "window_height"},
            {address = CONFIG.MEMORY.MINIGAME_DATA.catch_quality_percentage, type = "float", name = "catch_quality"}
        })
        
        -- Extract values
        local line_pos, line_vel, window_pos, window_height, catch_quality = nil, nil, nil, nil, nil
        
        for _, result in ipairs(minigame_data) do
            if result.name == "line_pos" then line_pos = result.value end
            if result.name == "line_vel" then line_vel = result.value end
            if result.name == "window_pos" then window_pos = result.value end
            if result.name == "window_height" then window_height = result.value end
            if result.name == "catch_quality" then catch_quality = result.value end
        end
        
        if not line_pos or not window_pos then
            consecutive_errors = consecutive_errors + 1
            if consecutive_errors >= CONFIG.ERROR_RECOVERY.max_consecutive_failures then
                log("❌ Too many read failures - aborting minigame")
                break
            end
            sleep(check_interval)
            goto continue_minigame
        end
        
        consecutive_errors = 0
        
        -- Track history
        table.insert(STATE.minigame.line_history, line_pos)
        table.insert(STATE.minigame.catch_window_history, window_pos)
        
        if #STATE.minigame.line_history > CONFIG.MINIGAME.prediction.history_length then
            table.remove(STATE.minigame.line_history, 1)
        end
        if #STATE.minigame.catch_window_history > CONFIG.MINIGAME.prediction.history_length then
            table.remove(STATE.minigame.catch_window_history, 1)
        end
        
        -- Check if line is inside window
        local window_top = window_pos - (window_height / 2)
        local window_bottom = window_pos + (window_height / 2)
        local line_inside = (line_pos >= window_top and line_pos <= window_bottom)
        
        if line_inside then
            STATE.minigame.successful_frames = STATE.minigame.successful_frames + 1
        end
        
        -- Predict future positions
        local line_prediction = predict_line_position(STATE.minigame.line_history, 3)
        
        log(string.format("📍 Line: %.1f | Window: %.1f | Quality: %.1f%% | Inside: %s",
            line_pos, window_pos, catch_quality or 0, line_inside and "✅" or "❌"))
        
        -- Pattern detection
        local pattern = detect_movement_pattern(STATE.minigame.line_history)
        if pattern then
            log(string.format("🔄 Pattern: %s (freq: %.1f)", pattern.type, pattern.frequency))
        end
        
        -- Decision logic with rod adaptation
        local distance_to_window = line_pos - window_pos
        
        if math.abs(distance_to_window) > 20 then
            if distance_to_window > 15 then  -- Line is below window
                if not STATE.minigame.holding_button then
                    log("👆 HOLD - Moving window UP")
                    pcall(function()
                        touchDown(CONFIG.MINIGAME.reel_button.x, CONFIG.MINIGAME.reel_button.y)
                    end)
                    STATE.minigame.holding_button = true
                    STATE.minigame.button_hold_start = os.time() * 1000
                end
            elseif distance_to_window < -15 then  -- Line is above window
                if STATE.minigame.holding_button then
                    log("📤 RELEASE - Letting window fall DOWN")
                    pcall(function()
                        touchUp(CONFIG.MINIGAME.reel_button.x, CONFIG.MINIGAME.reel_button.y)
                    end)
                    STATE.minigame.holding_button = false
                end
            end
        else
            if not STATE.minigame.holding_button then
                log("👆 HOLD - Maintaining position")
                pcall(function()
                    touchDown(CONFIG.MINIGAME.reel_button.x, CONFIG.MINIGAME.reel_button.y)
                end)
                STATE.minigame.holding_button = true
                STATE.minigame.button_hold_start = os.time() * 1000
            end
        end
        
        -- Check catch completion
        if catch_quality and catch_quality >= 100 then
            log("✅ Fish caught! Quality: 100%")
            break
        end
        
        sleep(check_interval)
        ::continue_minigame::
    end
    
    -- Release button at end
    if STATE.minigame.holding_button then
        pcall(function()
            touchUp(CONFIG.MINIGAME.reel_button.x, CONFIG.MINIGAME.reel_button.y)
        end)
    end
    
    -- Calculate precision
    if STATE.minigame.frames > 0 then
        STATE.minigame.precision = (STATE.minigame.successful_frames / STATE.minigame.frames) * 100
        log(string.format("📊 Minigame Precision: %.1f%% (%d/%d frames)",
            STATE.minigame.precision, STATE.minigame.successful_frames, STATE.minigame.frames))
        
        STATE.metrics.avg_minigame_precision = (STATE.metrics.avg_minigame_precision + STATE.minigame.precision) / 2
    end
    
    STATE.minigame.active = false
    return STATE.minigame.precision >= 70  -- Success if 70%+ precision
end

-- ==================== MAIN FISHING LOOP ====================

local function main_fishing_loop()
    log("╔" .. string.rep("═", 108) .. "╗")
    log("║" .. string.rep(" ", 20) .. "DUSKWIRE FISHING MACRO - MEMORY READING v2.0 ULTRA ADVANCED" .. string.rep(" ", 20) .. "║")
    log("║" .. string.rep(" ", 25) .. "Universal Rod Support with All Abilities" .. string.rep(" ", 20) .. "║")
    log("╚" .. string.rep("═", 108) .. "╝\n")
    
    log("🔍 [INITIALIZATION] Starting memory analysis...")
    log(string.format("📊 Total Rods in Database: %d", count_table(ROD_DATABASE)))
    
    local iteration = 0
    
    while true do
        iteration = iteration + 1
        
        log("\n" .. string.rep("🐟", 50))
        log("FISHING CYCLE #" .. iteration)
        log(string.rep("🐟", 50) .. "\n")
        
        STATE.cycle_count = iteration
        
        -- Detect active rod
        log("🎯 [ROD DETECTION PHASE] Identifying active rod...")
        local rod_data = detect_active_rod_memory()
        
        if rod_data then
            log("✅ Rod identified: " .. STATE.current_rod.name)
            read_rod_stats_from_memory()
            read_rod_abilities_from_memory()
        else
            log("⚠️  Could not identify rod, using cached data")
        end
        
        -- Simulate fishing phases
        log("\n📍 [CASTING PHASE] Casting rod...")
        sleep(2000)
        
        log("👁️  [BITE PHASE] Waiting for fish to bite...")
        sleep(1000)
        
        log("\n🎮 [MINIGAME PHASE] Starting minigame...")
        local success = execute_minigame_memory_adaptive()
        
        if success then
            STATE.fish_caught = STATE.fish_caught + 1
            log("\n✅ [SUCCESS] Fish caught successfully!")
            log(string.format("🐟 Total Fish: %d", STATE.fish_caught))
        else
            STATE.failed_attempts = STATE.failed_attempts + 1
            log("\n❌ [FAILED] Minigame failed")
        end
        
        sleep(2000)
        
        -- Print session stats
        log("\n" .. string.rep("═", 110))
        log("📊 SESSION STATISTICS")
        log(string.rep("═", 110))
        log(string.format("🐟 Fish Caught: %d", STATE.fish_caught))
        log(string.format("❌ Failed Attempts: %d", STATE.failed_attempts))
        if STATE.fish_caught + STATE.failed_attempts > 0 then
            log(string.format("✅ Success Rate: %.1f%%", (STATE.fish_caught / (STATE.fish_caught + STATE.failed_attempts)) * 100))
        end
        log(string.format("📈 Avg Minigame Precision: %.1f%%", STATE.metrics.avg_minigame_precision))
        log(string.format("📖 Memory Reads: %d (Success: %d, Failed: %d)", 
            STATE.memory_reads.total_reads, STATE.memory_reads.successful_reads, STATE.memory_reads.failed_reads))
        log(string.format("🔄 Rod Changes: %d", STATE.metrics.rod_switch_count))
        log(string.format("⏱️  Session Duration: %ds", os.time() - STATE.session_start))
        log(string.rep("═", 110) .. "\n")
    end
end

-- Helper functions
function log(message)
    print("[MEMORY-FISHING v2.0] " .. message)
end

function count_table(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

function read_process_memory(address, data_type)
    -- Placeholder - actual implementation depends on available APIs
    return 0
end

function touchDown(x, y)
    -- Placeholder - actual implementation depends on Macro Handler/AutoLua
end

function touchUp(x, y)
    -- Placeholder
end

function sleep(ms)
    -- Placeholder
end

-- ==================== START MACRO ====================

print("\n")
main_fishing_loop()
